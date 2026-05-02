.class public Lorg/junit/experimental/theories/internal/BooleanSupplier;
.super Lorg/junit/experimental/theories/ParameterSupplier;
.source "BooleanSupplier.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Lorg/junit/experimental/theories/ParameterSupplier;-><init>()V

    return-void
.end method


# virtual methods
.method public getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;
    .registers 7
    .param p1, "sig"    # Lorg/junit/experimental/theories/ParameterSignature;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/experimental/theories/ParameterSignature;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/junit/experimental/theories/PotentialAssignment;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 14
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/junit/experimental/theories/PotentialAssignment;

    const-string v1, "true"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "false"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
