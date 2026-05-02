.class public Lorg/junit/internal/InexactComparisonCriteria;
.super Lorg/junit/internal/ComparisonCriteria;
.source "InexactComparisonCriteria.java"


# instance fields
.field public fDelta:Ljava/lang/Object;


# direct methods
.method public constructor <init>(D)V
    .registers 4
    .param p1, "delta"    # D

    .prologue
    .line 8
    invoke-direct {p0}, Lorg/junit/internal/ComparisonCriteria;-><init>()V

    .line 9
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/InexactComparisonCriteria;->fDelta:Ljava/lang/Object;

    .line 10
    return-void
.end method

.method public constructor <init>(F)V
    .registers 3
    .param p1, "delta"    # F

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/junit/internal/ComparisonCriteria;-><init>()V

    .line 13
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/InexactComparisonCriteria;->fDelta:Ljava/lang/Object;

    .line 14
    return-void
.end method


# virtual methods
.method protected assertElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9
    .param p1, "expected"    # Ljava/lang/Object;
    .param p2, "actual"    # Ljava/lang/Object;

    .prologue
    .line 18
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_1c

    .line 19
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "expected":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    check-cast p2, Ljava/lang/Double;

    .end local p2    # "actual":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    iget-object v4, p0, Lorg/junit/internal/InexactComparisonCriteria;->fDelta:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    invoke-static/range {v0 .. v5}, Lorg/junit/Assert;->assertEquals(DDD)V

    .line 23
    :goto_1b
    return-void

    .line 21
    .restart local p1    # "expected":Ljava/lang/Object;
    .restart local p2    # "actual":Ljava/lang/Object;
    :cond_1c
    check-cast p1, Ljava/lang/Float;

    .end local p1    # "expected":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    check-cast p2, Ljava/lang/Float;

    .end local p2    # "actual":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget-object v0, p0, Lorg/junit/internal/InexactComparisonCriteria;->fDelta:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-static {v1, v2, v0}, Lorg/junit/Assert;->assertEquals(FFF)V

    goto :goto_1b
.end method
