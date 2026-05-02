.class Lorg/junit/internal/MethodSorter$2;
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
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 28
    check-cast p1, Ljava/lang/reflect/Method;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/reflect/Method;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/internal/MethodSorter$2;->compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I
    .registers 6
    .param p1, "m1"    # Ljava/lang/reflect/Method;
    .param p2, "m2"    # Ljava/lang/reflect/Method;

    .prologue
    .line 29
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 30
    .local v0, "comparison":I
    if-eqz v0, :cond_f

    .line 33
    .end local v0    # "comparison":I
    :goto_e
    return v0

    .restart local v0    # "comparison":I
    :cond_f
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_e
.end method
