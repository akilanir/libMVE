.class public Lorg/junit/runners/parameterized/TestWithParameters;
.super Ljava/lang/Object;
.source "TestWithParameters.java"


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final testClass:Lorg/junit/runners/model/TestClass;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/junit/runners/model/TestClass;Ljava/util/List;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "testClass"    # Lorg/junit/runners/model/TestClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/junit/runners/model/TestClass;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p3, "parameters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string v0, "The name is missing."

    invoke-static {p1, v0}, Lorg/junit/runners/parameterized/TestWithParameters;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    const-string v0, "The test class is missing."

    invoke-static {p2, v0}, Lorg/junit/runners/parameterized/TestWithParameters;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    const-string v0, "The parameters are missing."

    invoke-static {p3, v0}, Lorg/junit/runners/parameterized/TestWithParameters;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    iput-object p1, p0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    .line 32
    return-void
.end method

.method private static notNull(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 78
    if-nez p0, :cond_8

    .line 79
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_8
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 56
    if-ne p0, p1, :cond_5

    .line 66
    :cond_4
    :goto_4
    return v1

    .line 59
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 60
    goto :goto_4

    .line 62
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 63
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 65
    check-cast v0, Lorg/junit/runners/parameterized/TestWithParameters;

    .line 66
    .local v0, "other":Lorg/junit/runners/parameterized/TestWithParameters;
    iget-object v3, p0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    iget-object v3, p0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    iget-object v4, v0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    iget-object v3, p0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    iget-object v4, v0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    invoke-virtual {v3, v4}, Lorg/junit/runners/model/TestClass;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_36
    move v1, v2

    goto :goto_4
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    return-object v0
.end method

.method public getTestClass()Lorg/junit/runners/model/TestClass;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 48
    const/16 v0, 0x399b

    .line 49
    .local v0, "prime":I
    iget-object v2, p0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v1, v0, v2

    .line 50
    .local v1, "result":I
    mul-int v2, v0, v1

    iget-object v3, p0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    invoke-virtual {v3}, Lorg/junit/runners/model/TestClass;->hashCode()I

    move-result v3

    add-int v1, v2, v3

    .line 51
    mul-int v2, v0, v1

    iget-object v3, p0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v2, v3

    return v2
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/junit/runners/parameterized/TestWithParameters;->testClass:Lorg/junit/runners/model/TestClass;

    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/runners/parameterized/TestWithParameters;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\' with parameters "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/runners/parameterized/TestWithParameters;->parameters:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
