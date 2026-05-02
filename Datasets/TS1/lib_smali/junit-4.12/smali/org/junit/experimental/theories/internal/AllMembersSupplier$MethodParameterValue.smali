.class Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;
.super Lorg/junit/experimental/theories/PotentialAssignment;
.source "AllMembersSupplier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/theories/internal/AllMembersSupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MethodParameterValue"
.end annotation


# instance fields
.field private final method:Lorg/junit/runners/model/FrameworkMethod;


# direct methods
.method private constructor <init>(Lorg/junit/runners/model/FrameworkMethod;)V
    .registers 2
    .param p1, "dataPointMethod"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/junit/experimental/theories/PotentialAssignment;-><init>()V

    .line 28
    iput-object p1, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;->method:Lorg/junit/runners/model/FrameworkMethod;

    .line 29
    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/AllMembersSupplier$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "x1"    # Lorg/junit/experimental/theories/internal/AllMembersSupplier$1;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;-><init>(Lorg/junit/runners/model/FrameworkMethod;)V

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;->method:Lorg/junit/runners/model/FrameworkMethod;

    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 34
    :try_start_1
    iget-object v4, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;->method:Lorg/junit/runners/model/FrameworkMethod;

    const/4 v5, 0x0

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v4, v5, v6}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_a} :catch_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_a} :catch_15
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_a} :catch_1e

    move-result-object v3

    return-object v3

    .line 35
    :catch_c
    move-exception v1

    .line 36
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "unexpected: argument length is checked"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 38
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_15
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "unexpected: getMethods returned an inaccessible method"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 41
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_1e
    move-exception v2

    .line 42
    .local v2, "throwable":Ljava/lang/Throwable;
    iget-object v4, p0, Lorg/junit/experimental/theories/internal/AllMembersSupplier$MethodParameterValue;->method:Lorg/junit/runners/model/FrameworkMethod;

    const-class v5, Lorg/junit/experimental/theories/DataPoint;

    invoke-virtual {v4, v5}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/experimental/theories/DataPoint;

    .line 43
    .local v0, "annotation":Lorg/junit/experimental/theories/DataPoint;
    if-eqz v0, :cond_35

    invoke-interface {v0}, Lorg/junit/experimental/theories/DataPoint;->ignoredExceptions()[Ljava/lang/Class;

    move-result-object v4

    # invokes: Lorg/junit/experimental/theories/internal/AllMembersSupplier;->isAssignableToAnyOf([Ljava/lang/Class;Ljava/lang/Object;)Z
    invoke-static {v4, v2}, Lorg/junit/experimental/theories/internal/AllMembersSupplier;->access$000([Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_36

    :cond_35
    const/4 v3, 0x1

    :cond_36
    invoke-static {v3}, Lorg/junit/Assume;->assumeTrue(Z)V

    .line 45
    new-instance v3, Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;

    invoke-direct {v3, v2}, Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method
