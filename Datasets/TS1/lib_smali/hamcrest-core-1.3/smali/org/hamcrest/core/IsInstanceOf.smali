.class public Lorg/hamcrest/core/IsInstanceOf;
.super Lorg/hamcrest/DiagnosingMatcher;
.source "IsInstanceOf.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/hamcrest/DiagnosingMatcher",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final expectedClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final matchableClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p1, "expectedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/hamcrest/DiagnosingMatcher;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/hamcrest/core/IsInstanceOf;->expectedClass:Ljava/lang/Class;

    .line 27
    invoke-static {p1}, Lorg/hamcrest/core/IsInstanceOf;->matchableClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/hamcrest/core/IsInstanceOf;->matchableClass:Ljava/lang/Class;

    .line 28
    return-void
.end method

.method public static any(Ljava/lang/Class;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 95
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lorg/hamcrest/core/IsInstanceOf;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsInstanceOf;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public static instanceOf(Ljava/lang/Class;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 76
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/hamcrest/core/IsInstanceOf;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsInstanceOf;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method private static matchableClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "expectedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-class p0, Ljava/lang/Boolean;

    .line 39
    .end local p0    # "expectedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_a
    :goto_a
    return-object p0

    .line 32
    .restart local p0    # "expectedClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_b
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-class p0, Ljava/lang/Byte;

    goto :goto_a

    .line 33
    :cond_16
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-class p0, Ljava/lang/Character;

    goto :goto_a

    .line 34
    :cond_21
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-class p0, Ljava/lang/Double;

    goto :goto_a

    .line 35
    :cond_2c
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    const-class p0, Ljava/lang/Float;

    goto :goto_a

    .line 36
    :cond_37
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    const-class p0, Ljava/lang/Integer;

    goto :goto_a

    .line 37
    :cond_42
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    const-class p0, Ljava/lang/Long;

    goto :goto_a

    .line 38
    :cond_4d
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    const-class p0, Ljava/lang/Short;

    goto :goto_a
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 59
    const-string v0, "an instance of "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/core/IsInstanceOf;->expectedClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 60
    return-void
.end method

.method protected matches(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
    .registers 7
    .param p1, "item"    # Ljava/lang/Object;
    .param p2, "mismatch"    # Lorg/hamcrest/Description;

    .prologue
    const/4 v0, 0x0

    .line 44
    if-nez p1, :cond_9

    .line 45
    const-string v1, "null"

    invoke-interface {p2, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 54
    :goto_8
    return v0

    .line 49
    :cond_9
    iget-object v1, p0, Lorg/hamcrest/core/IsInstanceOf;->matchableClass:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    .line 50
    invoke-interface {p2, p1}, Lorg/hamcrest/Description;->appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " is a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    goto :goto_8

    .line 54
    :cond_34
    const/4 v0, 0x1

    goto :goto_8
.end method
