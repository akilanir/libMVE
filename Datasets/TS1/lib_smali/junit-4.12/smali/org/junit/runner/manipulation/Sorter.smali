.class public Lorg/junit/runner/manipulation/Sorter;
.super Ljava/lang/Object;
.source "Sorter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/junit/runner/Description;",
        ">;"
    }
.end annotation


# static fields
.field public static final NULL:Lorg/junit/runner/manipulation/Sorter;


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 17
    new-instance v0, Lorg/junit/runner/manipulation/Sorter;

    new-instance v1, Lorg/junit/runner/manipulation/Sorter$1;

    invoke-direct {v1}, Lorg/junit/runner/manipulation/Sorter$1;-><init>()V

    invoke-direct {v0, v1}, Lorg/junit/runner/manipulation/Sorter;-><init>(Ljava/util/Comparator;)V

    sput-object v0, Lorg/junit/runner/manipulation/Sorter;->NULL:Lorg/junit/runner/manipulation/Sorter;

    return-void
.end method

.method public constructor <init>(Ljava/util/Comparator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator",
            "<",
            "Lorg/junit/runner/Description;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<Lorg/junit/runner/Description;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/junit/runner/manipulation/Sorter;->comparator:Ljava/util/Comparator;

    .line 33
    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/Object;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 39
    instance-of v1, p1, Lorg/junit/runner/manipulation/Sortable;

    if-eqz v1, :cond_a

    move-object v0, p1

    .line 40
    check-cast v0, Lorg/junit/runner/manipulation/Sortable;

    .line 41
    .local v0, "sortable":Lorg/junit/runner/manipulation/Sortable;
    invoke-interface {v0, p0}, Lorg/junit/runner/manipulation/Sortable;->sort(Lorg/junit/runner/manipulation/Sorter;)V

    .line 43
    .end local v0    # "sortable":Lorg/junit/runner/manipulation/Sortable;
    :cond_a
    return-void
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 13
    check-cast p1, Lorg/junit/runner/Description;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/junit/runner/Description;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runner/manipulation/Sorter;->compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I
    .registers 4
    .param p1, "o1"    # Lorg/junit/runner/Description;
    .param p2, "o2"    # Lorg/junit/runner/Description;

    .prologue
    .line 46
    iget-object v0, p0, Lorg/junit/runner/manipulation/Sorter;->comparator:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
