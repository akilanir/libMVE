.class public Lorg/junit/internal/matchers/ThrowableMessageMatcher;
.super Lorg/hamcrest/TypeSafeMatcher;
.source "ThrowableMessageMatcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Throwable;",
        ">",
        "Lorg/hamcrest/TypeSafeMatcher",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final matcher:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/hamcrest/Matcher;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    .local p1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeMatcher;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->matcher:Lorg/hamcrest/Matcher;

    .line 15
    return-void
.end method

.method public static hasMessage(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Throwable;",
            ">(",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 35
    .local p0, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<Ljava/lang/String;>;"
    new-instance v0, Lorg/junit/internal/matchers/ThrowableMessageMatcher;

    invoke-direct {v0, p0}, Lorg/junit/internal/matchers/ThrowableMessageMatcher;-><init>(Lorg/hamcrest/Matcher;)V

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic describeMismatchSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/hamcrest/Description;

    .prologue
    .line 8
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    check-cast p1, Ljava/lang/Throwable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->describeMismatchSafely(Ljava/lang/Throwable;Lorg/hamcrest/Description;)V

    return-void
.end method

.method protected describeMismatchSafely(Ljava/lang/Throwable;Lorg/hamcrest/Description;)V
    .registers 5
    .param p2, "description"    # Lorg/hamcrest/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/hamcrest/Description;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    .local p1, "item":Ljava/lang/Throwable;, "TT;"
    const-string v0, "message "

    invoke-interface {p2, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 30
    iget-object v0, p0, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->matcher:Lorg/hamcrest/Matcher;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 31
    return-void
.end method

.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 18
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    const-string v0, "exception with message "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 19
    iget-object v0, p0, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 20
    return-void
.end method

.method protected bridge synthetic matchesSafely(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 8
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    check-cast p1, Ljava/lang/Throwable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->matchesSafely(Ljava/lang/Throwable;)Z

    move-result v0

    return v0
.end method

.method protected matchesSafely(Ljava/lang/Throwable;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lorg/junit/internal/matchers/ThrowableMessageMatcher;, "Lorg/junit/internal/matchers/ThrowableMessageMatcher<TT;>;"
    .local p1, "item":Ljava/lang/Throwable;, "TT;"
    iget-object v0, p0, Lorg/junit/internal/matchers/ThrowableMessageMatcher;->matcher:Lorg/hamcrest/Matcher;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
