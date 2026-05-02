.class public Lorg/junit/Assume;
.super Ljava/lang/Object;
.source "Assume.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static assumeFalse(Ljava/lang/String;Z)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "b"    # Z

    .prologue
    .line 66
    if-nez p1, :cond_7

    const/4 v0, 0x1

    :goto_3
    invoke-static {p0, v0}, Lorg/junit/Assume;->assumeTrue(Ljava/lang/String;Z)V

    .line 67
    return-void

    .line 66
    :cond_7
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static assumeFalse(Z)V
    .registers 2
    .param p0, "b"    # Z

    .prologue
    .line 48
    if-nez p0, :cond_7

    const/4 v0, 0x1

    :goto_3
    invoke-static {v0}, Lorg/junit/Assume;->assumeTrue(Z)V

    .line 49
    return-void

    .line 48
    :cond_7
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static assumeNoException(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 156
    invoke-static {}, Lorg/hamcrest/CoreMatchers;->nullValue()Lorg/hamcrest/Matcher;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/junit/Assume;->assumeThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 157
    return-void
.end method

.method public static assumeNoException(Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 142
    invoke-static {}, Lorg/hamcrest/CoreMatchers;->nullValue()Lorg/hamcrest/Matcher;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/junit/Assume;->assumeThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 143
    return-void
.end method

.method public static varargs assumeNotNull([Ljava/lang/Object;)V
    .registers 3
    .param p0, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 73
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {}, Lorg/hamcrest/CoreMatchers;->notNullValue()Lorg/hamcrest/Matcher;

    move-result-object v1

    invoke-static {v1}, Lorg/hamcrest/CoreMatchers;->everyItem(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/junit/Assume;->assumeThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 74
    return-void
.end method

.method public static assumeThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Lorg/hamcrest/Matcher",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "actual":Ljava/lang/Object;, "TT;"
    .local p1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    invoke-interface {p1, p0}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 95
    new-instance v0, Lorg/junit/AssumptionViolatedException;

    invoke-direct {v0, p0, p1}, Lorg/junit/AssumptionViolatedException;-><init>(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    throw v0

    .line 97
    :cond_c
    return-void
.end method

.method public static assumeThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 4
    .param p0, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;",
            "Lorg/hamcrest/Matcher",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p1, "actual":Ljava/lang/Object;, "TT;"
    .local p2, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    invoke-interface {p2, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 118
    new-instance v0, Lorg/junit/AssumptionViolatedException;

    invoke-direct {v0, p0, p1, p2}, Lorg/junit/AssumptionViolatedException;-><init>(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    throw v0

    .line 120
    :cond_c
    return-void
.end method

.method public static assumeTrue(Ljava/lang/String;Z)V
    .registers 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "b"    # Z

    .prologue
    .line 59
    if-nez p1, :cond_8

    new-instance v0, Lorg/junit/AssumptionViolatedException;

    invoke-direct {v0, p0}, Lorg/junit/AssumptionViolatedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_8
    return-void
.end method

.method public static assumeTrue(Z)V
    .registers 3
    .param p0, "b"    # Z

    .prologue
    .line 41
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v1}, Lorg/hamcrest/CoreMatchers;->is(Ljava/lang/Object;)Lorg/hamcrest/Matcher;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/junit/Assume;->assumeThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 42
    return-void
.end method
