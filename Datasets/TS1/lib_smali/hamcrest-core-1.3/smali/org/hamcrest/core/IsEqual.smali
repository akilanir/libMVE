.class public Lorg/hamcrest/core/IsEqual;
.super Lorg/hamcrest/BaseMatcher;
.source "IsEqual.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/BaseMatcher",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final expectedValue:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lorg/hamcrest/core/IsEqual;, "Lorg/hamcrest/core/IsEqual<TT;>;"
    .local p1, "equalArg":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 21
    iput-object p1, p0, Lorg/hamcrest/core/IsEqual;->expectedValue:Ljava/lang/Object;

    .line 22
    return-void
.end method

.method private static areArrayElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "actualArray"    # Ljava/lang/Object;
    .param p1, "expectedArray"    # Ljava/lang/Object;

    .prologue
    .line 55
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    if-ge v0, v1, :cond_1a

    .line 56
    invoke-static {p0, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/hamcrest/core/IsEqual;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    .line 57
    const/4 v1, 0x0

    .line 60
    :goto_16
    return v1

    .line 55
    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 60
    :cond_1a
    const/4 v1, 0x1

    goto :goto_16
.end method

.method private static areArrayLengthsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "actualArray"    # Ljava/lang/Object;
    .param p1, "expectedArray"    # Ljava/lang/Object;

    .prologue
    .line 51
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static areArraysEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .param p0, "actualArray"    # Ljava/lang/Object;
    .param p1, "expectedArray"    # Ljava/lang/Object;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lorg/hamcrest/core/IsEqual;->areArrayLengthsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-static {p0, p1}, Lorg/hamcrest/core/IsEqual;->areArrayElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5
    .param p0, "actual"    # Ljava/lang/Object;
    .param p1, "expected"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 35
    if-nez p0, :cond_9

    .line 36
    if-nez p1, :cond_7

    .line 43
    :cond_6
    :goto_6
    return v0

    :cond_7
    move v0, v1

    .line 36
    goto :goto_6

    .line 39
    :cond_9
    if-eqz p1, :cond_1f

    invoke-static {p0}, Lorg/hamcrest/core/IsEqual;->isArray(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 40
    invoke-static {p1}, Lorg/hamcrest/core/IsEqual;->isArray(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-static {p0, p1}, Lorg/hamcrest/core/IsEqual;->areArraysEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    :cond_1d
    move v0, v1

    goto :goto_6

    .line 43
    :cond_1f
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_6
.end method

.method public static equalTo(Ljava/lang/Object;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 92
    .local p0, "operand":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/hamcrest/core/IsEqual;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsEqual;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method private static isArray(Ljava/lang/Object;)Z
    .registers 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 31
    .local p0, "this":Lorg/hamcrest/core/IsEqual;, "Lorg/hamcrest/core/IsEqual<TT;>;"
    iget-object v0, p0, Lorg/hamcrest/core/IsEqual;->expectedValue:Ljava/lang/Object;

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;

    .line 32
    return-void
.end method

.method public matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "actualValue"    # Ljava/lang/Object;

    .prologue
    .line 26
    .local p0, "this":Lorg/hamcrest/core/IsEqual;, "Lorg/hamcrest/core/IsEqual<TT;>;"
    iget-object v0, p0, Lorg/hamcrest/core/IsEqual;->expectedValue:Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/hamcrest/core/IsEqual;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
