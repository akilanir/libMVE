.class public Lorg/junit/internal/ArrayComparisonFailure;
.super Ljava/lang/AssertionError;
.source "ArrayComparisonFailure.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fIndices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final fMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/AssertionError;I)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/AssertionError;
    .param p3, "index"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/internal/ArrayComparisonFailure;->fIndices:Ljava/util/List;

    .line 34
    iput-object p1, p0, Lorg/junit/internal/ArrayComparisonFailure;->fMessage:Ljava/lang/String;

    .line 35
    invoke-virtual {p0, p2}, Lorg/junit/internal/ArrayComparisonFailure;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 36
    invoke-virtual {p0, p3}, Lorg/junit/internal/ArrayComparisonFailure;->addDimension(I)V

    .line 37
    return-void
.end method


# virtual methods
.method public addDimension(I)V
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 40
    iget-object v0, p0, Lorg/junit/internal/ArrayComparisonFailure;->fIndices:Ljava/util/List;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 41
    return-void
.end method

.method public getMessage()Ljava/lang/String;
    .registers 5

    .prologue
    .line 45
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/junit/internal/ArrayComparisonFailure;->fMessage:Ljava/lang/String;

    if-eqz v3, :cond_e

    .line 47
    iget-object v3, p0, Lorg/junit/internal/ArrayComparisonFailure;->fMessage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    :cond_e
    const-string v3, "arrays first differed at element "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    iget-object v3, p0, Lorg/junit/internal/ArrayComparisonFailure;->fIndices:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_37

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 51
    .local v0, "each":I
    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 55
    .end local v0    # "each":I
    :cond_37
    const-string v3, "; "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {p0}, Lorg/junit/internal/ArrayComparisonFailure;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/junit/internal/ArrayComparisonFailure;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
