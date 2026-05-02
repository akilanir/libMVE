.class public Lorg/hamcrest/MatcherAssert;
.super Ljava/lang/Object;
.source "MatcherAssert.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assertThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 8
    .local p0, "actual":Ljava/lang/Object;, "TT;"
    .local p1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    const-string v0, ""

    invoke-static {v0, p0, p1}, Lorg/hamcrest/MatcherAssert;->assertThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 9
    return-void
.end method

.method public static assertThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 6
    .param p0, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 12
    .local p1, "actual":Ljava/lang/Object;, "TT;"
    .local p2, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    invoke-interface {p2, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    .line 13
    new-instance v0, Lorg/hamcrest/StringDescription;

    invoke-direct {v0}, Lorg/hamcrest/StringDescription;-><init>()V

    .line 14
    .local v0, "description":Lorg/hamcrest/Description;
    invoke-interface {v0, p0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v1

    const-string v2, "\nExpected: "

    invoke-interface {v1, v2}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v1

    invoke-interface {v1, p2}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    move-result-object v1

    const-string v2, "\n     but: "

    invoke-interface {v1, v2}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 18
    invoke-interface {p2, p1, v0}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 20
    new-instance v1, Ljava/lang/AssertionError;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 22
    .end local v0    # "description":Lorg/hamcrest/Description;
    :cond_2b
    return-void
.end method

.method public static assertThat(Ljava/lang/String;Z)V
    .registers 3
    .param p0, "reason"    # Ljava/lang/String;
    .param p1, "assertion"    # Z

    .prologue
    .line 25
    if-nez p1, :cond_8

    .line 26
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 28
    :cond_8
    return-void
.end method
