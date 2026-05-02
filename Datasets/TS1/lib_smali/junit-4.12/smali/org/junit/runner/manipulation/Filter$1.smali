.class Lorg/junit/runner/manipulation/Filter$1;
.super Lorg/junit/runner/manipulation/Filter;
.source "Filter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runner/manipulation/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/junit/runner/manipulation/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)V
    .registers 2
    .param p1, "child"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 35
    return-void
.end method

.method public describe()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
    const-string v0, "all tests"

    return-object v0
.end method

.method public intersect(Lorg/junit/runner/manipulation/Filter;)Lorg/junit/runner/manipulation/Filter;
    .registers 2
    .param p1, "second"    # Lorg/junit/runner/manipulation/Filter;

    .prologue
    .line 39
    return-object p1
.end method

.method public shouldRun(Lorg/junit/runner/Description;)Z
    .registers 3
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 24
    const/4 v0, 0x1

    return v0
.end method
