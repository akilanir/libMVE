.class public Lorg/junit/experimental/theories/suppliers/TestedOnSupplier;
.super Lorg/junit/experimental/theories/ParameterSupplier;
.source "TestedOnSupplier.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Lorg/junit/experimental/theories/ParameterSupplier;-><init>()V

    return-void
.end method


# virtual methods
.method public getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;
    .registers 11
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
    .line 17
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    const-class v7, Lorg/junit/experimental/theories/suppliers/TestedOn;

    invoke-virtual {p1, v7}, Lorg/junit/experimental/theories/ParameterSignature;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lorg/junit/experimental/theories/suppliers/TestedOn;

    .line 19
    .local v6, "testedOn":Lorg/junit/experimental/theories/suppliers/TestedOn;
    invoke-interface {v6}, Lorg/junit/experimental/theories/suppliers/TestedOn;->ints()[I

    move-result-object v3

    .line 20
    .local v3, "ints":[I
    move-object v0, v3

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_14
    if-ge v2, v4, :cond_28

    aget v1, v0, v2

    .line 21
    .local v1, "i":I
    const-string v7, "ints"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v7, v8}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 23
    .end local v1    # "i":I
    :cond_28
    return-object v5
.end method
