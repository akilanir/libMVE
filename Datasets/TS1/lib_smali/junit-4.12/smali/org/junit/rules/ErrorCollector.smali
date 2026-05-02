.class public Lorg/junit/rules/ErrorCollector;
.super Lorg/junit/rules/Verifier;
.source "ErrorCollector.java"


# instance fields
.field private errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/junit/rules/Verifier;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/rules/ErrorCollector;->errors:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/junit/rules/ErrorCollector;->errors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    return-void
.end method

.method public checkSucceeds(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 78
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TT;>;"
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 81
    :goto_4
    return-object v1

    .line 79
    :catch_5
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lorg/junit/rules/ErrorCollector;->addError(Ljava/lang/Throwable;)V

    .line 81
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public checkThat(Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 4
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
    .line 54
    .local p1, "value":Ljava/lang/Object;, "TT;"
    .local p2, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    const-string v0, ""

    invoke-virtual {p0, v0, p1, p2}, Lorg/junit/rules/ErrorCollector;->checkThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    .line 55
    return-void
.end method

.method public checkThat(Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V
    .registers 5
    .param p1, "reason"    # Ljava/lang/String;
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
    .line 63
    .local p2, "value":Ljava/lang/Object;, "TT;"
    .local p3, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    new-instance v0, Lorg/junit/rules/ErrorCollector$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/junit/rules/ErrorCollector$1;-><init>(Lorg/junit/rules/ErrorCollector;Ljava/lang/String;Ljava/lang/Object;Lorg/hamcrest/Matcher;)V

    invoke-virtual {p0, v0}, Lorg/junit/rules/ErrorCollector;->checkSucceeds(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method protected verify()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lorg/junit/rules/ErrorCollector;->errors:Ljava/util/List;

    invoke-static {v0}, Lorg/junit/runners/model/MultipleFailureException;->assertEmpty(Ljava/util/List;)V

    .line 40
    return-void
.end method
