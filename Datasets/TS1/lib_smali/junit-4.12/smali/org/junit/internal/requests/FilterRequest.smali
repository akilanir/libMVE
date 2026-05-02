.class public final Lorg/junit/internal/requests/FilterRequest;
.super Lorg/junit/runner/Request;
.source "FilterRequest.java"


# instance fields
.field private final fFilter:Lorg/junit/runner/manipulation/Filter;

.field private final request:Lorg/junit/runner/Request;


# direct methods
.method public constructor <init>(Lorg/junit/runner/Request;Lorg/junit/runner/manipulation/Filter;)V
    .registers 3
    .param p1, "request"    # Lorg/junit/runner/Request;
    .param p2, "filter"    # Lorg/junit/runner/manipulation/Filter;

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/junit/internal/requests/FilterRequest;->request:Lorg/junit/runner/Request;

    .line 30
    iput-object p2, p0, Lorg/junit/internal/requests/FilterRequest;->fFilter:Lorg/junit/runner/manipulation/Filter;

    .line 31
    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .registers 9

    .prologue
    .line 36
    :try_start_0
    iget-object v2, p0, Lorg/junit/internal/requests/FilterRequest;->request:Lorg/junit/runner/Request;

    invoke-virtual {v2}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v1

    .line 37
    .local v1, "runner":Lorg/junit/runner/Runner;
    iget-object v2, p0, Lorg/junit/internal/requests/FilterRequest;->fFilter:Lorg/junit/runner/manipulation/Filter;

    invoke-virtual {v2, v1}, Lorg/junit/runner/manipulation/Filter;->apply(Ljava/lang/Object;)V
    :try_end_b
    .catch Lorg/junit/runner/manipulation/NoTestsRemainException; {:try_start_0 .. :try_end_b} :catch_c

    .line 40
    .end local v1    # "runner":Lorg/junit/runner/Runner;
    :goto_b
    return-object v1

    .line 39
    :catch_c
    move-exception v0

    .line 40
    .local v0, "e":Lorg/junit/runner/manipulation/NoTestsRemainException;
    new-instance v1, Lorg/junit/internal/runners/ErrorReportingRunner;

    const-class v2, Lorg/junit/runner/manipulation/Filter;

    new-instance v3, Ljava/lang/Exception;

    const-string v4, "No tests found matching %s from %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/junit/internal/requests/FilterRequest;->fFilter:Lorg/junit/runner/manipulation/Filter;

    invoke-virtual {v7}, Lorg/junit/runner/manipulation/Filter;->describe()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lorg/junit/internal/requests/FilterRequest;->request:Lorg/junit/runner/Request;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2, v3}, Lorg/junit/internal/runners/ErrorReportingRunner;-><init>(Ljava/lang/Class;Ljava/lang/Throwable;)V

    goto :goto_b
.end method
