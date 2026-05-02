.class public Lorg/hamcrest/core/IsNot;
.super Lorg/hamcrest/BaseMatcher;
.source "IsNot.java"


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
.field private final matcher:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/hamcrest/Matcher;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/hamcrest/Matcher",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lorg/hamcrest/core/IsNot;, "Lorg/hamcrest/core/IsNot<TT;>;"
    .local p1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 20
    iput-object p1, p0, Lorg/hamcrest/core/IsNot;->matcher:Lorg/hamcrest/Matcher;

    .line 21
    return-void
.end method

.method public static not(Ljava/lang/Object;)Lorg/hamcrest/Matcher;
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
    .line 62
    .local p0, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p0}, Lorg/hamcrest/core/IsEqual;->equalTo(Ljava/lang/Object;)Lorg/hamcrest/Matcher;

    move-result-object v0

    invoke-static {v0}, Lorg/hamcrest/core/IsNot;->not(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;

    move-result-object v0

    return-object v0
.end method

.method public static not(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Matcher",
            "<TT;>;)",
            "Lorg/hamcrest/Matcher",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 46
    .local p0, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<TT;>;"
    new-instance v0, Lorg/hamcrest/core/IsNot;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsNot;-><init>(Lorg/hamcrest/Matcher;)V

    return-object v0
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 30
    .local p0, "this":Lorg/hamcrest/core/IsNot;, "Lorg/hamcrest/core/IsNot<TT;>;"
    const-string v0, "not "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/core/IsNot;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 31
    return-void
.end method

.method public matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "arg"    # Ljava/lang/Object;

    .prologue
    .line 25
    .local p0, "this":Lorg/hamcrest/core/IsNot;, "Lorg/hamcrest/core/IsNot<TT;>;"
    iget-object v0, p0, Lorg/hamcrest/core/IsNot;->matcher:Lorg/hamcrest/Matcher;

    invoke-interface {v0, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
