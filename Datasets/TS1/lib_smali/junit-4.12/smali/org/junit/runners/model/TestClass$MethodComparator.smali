.class Lorg/junit/runners/model/TestClass$MethodComparator;
.super Ljava/lang/Object;
.source "TestClass.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/runners/model/TestClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MethodComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/junit/runners/model/FrameworkMethod;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 307
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/runners/model/TestClass$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/runners/model/TestClass$1;

    .prologue
    .line 307
    invoke-direct {p0}, Lorg/junit/runners/model/TestClass$MethodComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 307
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/junit/runners/model/FrameworkMethod;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runners/model/TestClass$MethodComparator;->compare(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runners/model/FrameworkMethod;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runners/model/FrameworkMethod;)I
    .registers 6
    .param p1, "left"    # Lorg/junit/runners/model/FrameworkMethod;
    .param p2, "right"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 310
    sget-object v0, Lorg/junit/internal/MethodSorter;->NAME_ASCENDING:Ljava/util/Comparator;

    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {p2}, Lorg/junit/runners/model/FrameworkMethod;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
