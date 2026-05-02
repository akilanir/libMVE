.class public abstract Lorg/hamcrest/core/SubstringMatcher;
.super Lorg/hamcrest/TypeSafeMatcher;
.source "SubstringMatcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/hamcrest/TypeSafeMatcher",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field protected final substring:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "substring"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeMatcher;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/hamcrest/core/SubstringMatcher;->substring:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic describeMismatchSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/hamcrest/Description;

    .prologue
    .line 6
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/core/SubstringMatcher;->describeMismatchSafely(Ljava/lang/String;Lorg/hamcrest/Description;)V

    return-void
.end method

.method public describeMismatchSafely(Ljava/lang/String;Lorg/hamcrest/Description;)V
    .registers 5
    .param p1, "item"    # Ljava/lang/String;
    .param p2, "mismatchDescription"    # Lorg/hamcrest/Description;

    .prologue
    .line 23
    const-string v0, "was \""

    invoke-interface {p2, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    const-string v1, "\""

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 24
    return-void
.end method

.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 28
    const-string v0, "a string "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    invoke-virtual {p0}, Lorg/hamcrest/core/SubstringMatcher;->relationship()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    const-string v1, " "

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/core/SubstringMatcher;->substring:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;

    .line 32
    return-void
.end method

.method protected abstract evalSubstringOf(Ljava/lang/String;)Z
.end method

.method public bridge synthetic matchesSafely(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 6
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/hamcrest/core/SubstringMatcher;->matchesSafely(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public matchesSafely(Ljava/lang/String;)Z
    .registers 3
    .param p1, "item"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lorg/hamcrest/core/SubstringMatcher;->evalSubstringOf(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected abstract relationship()Ljava/lang/String;
.end method
