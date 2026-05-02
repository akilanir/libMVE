.class Lorg/junit/runner/manipulation/Sorter$1;
.super Ljava/lang/Object;
.source "Sorter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runner/manipulation/Sorter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/junit/runner/Description;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 18
    check-cast p1, Lorg/junit/runner/Description;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/junit/runner/Description;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runner/manipulation/Sorter$1;->compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/junit/runner/Description;Lorg/junit/runner/Description;)I
    .registers 4
    .param p1, "o1"    # Lorg/junit/runner/Description;
    .param p2, "o2"    # Lorg/junit/runner/Description;

    .prologue
    .line 19
    const/4 v0, 0x0

    return v0
.end method
