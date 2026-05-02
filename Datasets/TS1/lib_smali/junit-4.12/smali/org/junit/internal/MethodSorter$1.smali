.class Lorg/junit/internal/MethodSorter$1;
.super Ljava/lang/Object;
.source "MethodSorter.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/internal/MethodSorter;
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
        "Ljava/lang/reflect/Method;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 14
    check-cast p1, Ljava/lang/reflect/Method;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/reflect/Method;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/internal/MethodSorter$1;->compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I
    .registers 6
    .param p1, "m1"    # Ljava/lang/reflect/Method;
    .param p2, "m2"    # Ljava/lang/reflect/Method;

    .prologue
    .line 15
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 16
    .local v0, "i1":I
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v1

    .line 17
    .local v1, "i2":I
    if-eq v0, v1, :cond_18

    .line 18
    if-ge v0, v1, :cond_16

    const/4 v2, -0x1

    .line 20
    :goto_15
    return v2

    .line 18
    :cond_16
    const/4 v2, 0x1

    goto :goto_15

    .line 20
    :cond_18
    sget-object v2, Lorg/junit/internal/MethodSorter;->NAME_ASCENDING:Ljava/util/Comparator;

    invoke-interface {v2, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    goto :goto_15
.end method
