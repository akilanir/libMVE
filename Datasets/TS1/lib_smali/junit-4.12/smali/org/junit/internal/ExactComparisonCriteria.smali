.class public Lorg/junit/internal/ExactComparisonCriteria;
.super Lorg/junit/internal/ComparisonCriteria;
.source "ExactComparisonCriteria.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Lorg/junit/internal/ComparisonCriteria;-><init>()V

    return-void
.end method


# virtual methods
.method protected assertElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 8
    invoke-static {p1, p2}, Lorg/junit/Assert;->assertEquals(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 9
    return-void
.end method
