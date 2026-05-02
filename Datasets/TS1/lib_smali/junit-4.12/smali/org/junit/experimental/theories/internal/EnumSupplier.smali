.class public Lorg/junit/experimental/theories/internal/EnumSupplier;
.super Lorg/junit/experimental/theories/ParameterSupplier;
.source "EnumSupplier.java"


# instance fields
.field private enumType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p1, "enumType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/junit/experimental/theories/ParameterSupplier;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/junit/experimental/theories/internal/EnumSupplier;->enumType:Ljava/lang/Class;

    .line 16
    return-void
.end method


# virtual methods
.method public getValueSources(Lorg/junit/experimental/theories/ParameterSignature;)Ljava/util/List;
    .registers 9
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
    .line 20
    iget-object v6, p0, Lorg/junit/experimental/theories/internal/EnumSupplier;->enumType:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v2

    .line 22
    .local v2, "enumValues":[Ljava/lang/Object;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .local v1, "assignments":Ljava/util/List;, "Ljava/util/List<Lorg/junit/experimental/theories/PotentialAssignment;>;"
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_e
    if-ge v3, v4, :cond_20

    aget-object v5, v0, v3

    .line 24
    .local v5, "value":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v5}, Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 27
    .end local v5    # "value":Ljava/lang/Object;
    :cond_20
    return-object v1
.end method
