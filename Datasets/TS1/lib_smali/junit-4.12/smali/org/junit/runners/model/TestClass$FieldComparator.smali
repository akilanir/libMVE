.class Lorg/junit/runners/model/TestClass$FieldComparator;
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
    name = "FieldComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/reflect/Field;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 298
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/runners/model/TestClass$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/runners/model/TestClass$1;

    .prologue
    .line 298
    invoke-direct {p0}, Lorg/junit/runners/model/TestClass$FieldComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 298
    check-cast p1, Ljava/lang/reflect/Field;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/reflect/Field;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/junit/runners/model/TestClass$FieldComparator;->compare(Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)I
    .registers 5
    .param p1, "left"    # Ljava/lang/reflect/Field;
    .param p2, "right"    # Ljava/lang/reflect/Field;

    .prologue
    .line 300
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
