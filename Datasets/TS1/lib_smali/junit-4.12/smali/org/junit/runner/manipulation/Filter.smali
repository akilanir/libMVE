.class public abstract Lorg/junit/runner/manipulation/Filter;
.super Ljava/lang/Object;
.source "Filter.java"


# static fields
.field public static final ALL:Lorg/junit/runner/manipulation/Filter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 21
    new-instance v0, Lorg/junit/runner/manipulation/Filter$1;

    invoke-direct {v0}, Lorg/junit/runner/manipulation/Filter$1;-><init>()V

    sput-object v0, Lorg/junit/runner/manipulation/Filter;->ALL:Lorg/junit/runner/manipulation/Filter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static matchMethodDescription(Lorg/junit/runner/Description;)Lorg/junit/runner/manipulation/Filter;
    .registers 2
    .param p0, "desiredDescription"    # Lorg/junit/runner/Description;

    .prologue
    .line 48
    new-instance v0, Lorg/junit/runner/manipulation/Filter$2;

    invoke-direct {v0, p0}, Lorg/junit/runner/manipulation/Filter$2;-><init>(Lorg/junit/runner/Description;)V

    return-object v0
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)V
    .registers 4
    .param p1, "child"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .prologue
    .line 93
    instance-of v1, p1, Lorg/junit/runner/manipulation/Filterable;

    if-nez v1, :cond_5

    .line 98
    :goto_4
    return-void

    :cond_5
    move-object v0, p1

    .line 96
    check-cast v0, Lorg/junit/runner/manipulation/Filterable;

    .line 97
    .local v0, "filterable":Lorg/junit/runner/manipulation/Filterable;
    invoke-interface {v0, p0}, Lorg/junit/runner/manipulation/Filterable;->filter(Lorg/junit/runner/manipulation/Filter;)V

    goto :goto_4
.end method

.method public abstract describe()Ljava/lang/String;
.end method

.method public intersect(Lorg/junit/runner/manipulation/Filter;)Lorg/junit/runner/manipulation/Filter;
    .registers 4
    .param p1, "second"    # Lorg/junit/runner/manipulation/Filter;

    .prologue
    .line 105
    if-eq p1, p0, :cond_6

    sget-object v1, Lorg/junit/runner/manipulation/Filter;->ALL:Lorg/junit/runner/manipulation/Filter;

    if-ne p1, v1, :cond_7

    .line 109
    .end local p0    # "this":Lorg/junit/runner/manipulation/Filter;
    :cond_6
    :goto_6
    return-object p0

    .line 108
    .restart local p0    # "this":Lorg/junit/runner/manipulation/Filter;
    :cond_7
    move-object v0, p0

    .line 109
    .local v0, "first":Lorg/junit/runner/manipulation/Filter;
    new-instance v1, Lorg/junit/runner/manipulation/Filter$3;

    invoke-direct {v1, p0, v0, p1}, Lorg/junit/runner/manipulation/Filter$3;-><init>(Lorg/junit/runner/manipulation/Filter;Lorg/junit/runner/manipulation/Filter;Lorg/junit/runner/manipulation/Filter;)V

    move-object p0, v1

    goto :goto_6
.end method

.method public abstract shouldRun(Lorg/junit/runner/Description;)Z
.end method
