.class public Lorg/hamcrest/core/Every;
.super Lorg/hamcrest/TypeSafeDiagnosingMatcher;
.source "Every.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/TypeSafeDiagnosingMatcher",
        "<",
        "Ljava/lang/Iterable",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private final matcher:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher",
            "<-TT;>;"
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
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p0, "this":Lorg/hamcrest/core/Every;, "Lorg/hamcrest/core/Every<TT;>;"
    .local p1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/hamcrest/core/Every;->matcher:Lorg/hamcrest/Matcher;

    .line 13
    return-void
.end method

.method public static everyItem(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Matcher",
            "<TU;>;)",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Iterable",
            "<TU;>;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 45
    .local p0, "itemMatcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TU;>;"
    new-instance v0, Lorg/hamcrest/core/Every;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/Every;-><init>(Lorg/hamcrest/Matcher;)V

    return-object v0
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 29
    .local p0, "this":Lorg/hamcrest/core/Every;, "Lorg/hamcrest/core/Every<TT;>;"
    const-string v0, "every item is "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/core/Every;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 30
    return-void
.end method

.method public matchesSafely(Ljava/lang/Iterable;Lorg/hamcrest/Description;)Z
    .registers 6
    .param p2, "mismatchDescription"    # Lorg/hamcrest/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;",
            "Lorg/hamcrest/Description;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 17
    .local p0, "this":Lorg/hamcrest/core/Every;, "Lorg/hamcrest/core/Every<TT;>;"
    .local p1, "collection":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 18
    .local v1, "t":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lorg/hamcrest/core/Every;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {v2, v1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 19
    const-string v2, "an item "

    invoke-interface {p2, v2}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 20
    iget-object v2, p0, Lorg/hamcrest/core/Every;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {v2, v1, p2}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 21
    const/4 v2, 0x0

    .line 24
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    :goto_21
    return v2

    :cond_22
    const/4 v2, 0x1

    goto :goto_21
.end method

.method public bridge synthetic matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/hamcrest/Description;

    .prologue
    .line 8
    .local p0, "this":Lorg/hamcrest/core/Every;, "Lorg/hamcrest/core/Every<TT;>;"
    check-cast p1, Ljava/lang/Iterable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/core/Every;->matchesSafely(Ljava/lang/Iterable;Lorg/hamcrest/Description;)Z

    move-result v0

    return v0
.end method
