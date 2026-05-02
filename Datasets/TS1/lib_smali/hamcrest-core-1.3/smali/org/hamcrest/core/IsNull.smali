.class public Lorg/hamcrest/core/IsNull;
.super Lorg/hamcrest/BaseMatcher;
.source "IsNull.java"


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


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    .local p0, "this":Lorg/hamcrest/core/IsNull;, "Lorg/hamcrest/core/IsNull<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    return-void
.end method

.method public static notNullValue()Lorg/hamcrest/Matcher;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 48
    invoke-static {}, Lorg/hamcrest/core/IsNull;->nullValue()Lorg/hamcrest/Matcher;

    move-result-object v0

    invoke-static {v0}, Lorg/hamcrest/core/IsNot;->not(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;

    move-result-object v0

    return-object v0
.end method

.method public static notNullValue(Ljava/lang/Class;)Lorg/hamcrest/Matcher;
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
    .line 81
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p0}, Lorg/hamcrest/core/IsNull;->nullValue(Ljava/lang/Class;)Lorg/hamcrest/Matcher;

    move-result-object v0

    invoke-static {v0}, Lorg/hamcrest/core/IsNot;->not(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;

    move-result-object v0

    return-object v0
.end method

.method public static nullValue()Lorg/hamcrest/Matcher;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 34
    new-instance v0, Lorg/hamcrest/core/IsNull;

    invoke-direct {v0}, Lorg/hamcrest/core/IsNull;-><init>()V

    return-object v0
.end method

.method public static nullValue(Ljava/lang/Class;)Lorg/hamcrest/Matcher;
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
    .line 63
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lorg/hamcrest/core/IsNull;

    invoke-direct {v0}, Lorg/hamcrest/core/IsNull;-><init>()V

    return-object v0
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 22
    .local p0, "this":Lorg/hamcrest/core/IsNull;, "Lorg/hamcrest/core/IsNull<TT;>;"
    const-string v0, "null"

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 23
    return-void
.end method

.method public matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 17
    .local p0, "this":Lorg/hamcrest/core/IsNull;, "Lorg/hamcrest/core/IsNull<TT;>;"
    if-nez p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method
