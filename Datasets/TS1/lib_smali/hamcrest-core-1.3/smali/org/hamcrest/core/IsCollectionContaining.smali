.class public Lorg/hamcrest/core/IsCollectionContaining;
.super Lorg/hamcrest/TypeSafeDiagnosingMatcher;
.source "IsCollectionContaining.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/TypeSafeDiagnosingMatcher",
        "<",
        "Ljava/lang/Iterable",
        "<-TT;>;>;"
    }
.end annotation


# instance fields
.field private final elementMatcher:Lorg/hamcrest/Matcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/hamcrest/Matcher",
            "<-TT;>;"
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
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p0, "this":Lorg/hamcrest/core/IsCollectionContaining;, "Lorg/hamcrest/core/IsCollectionContaining<TT;>;"
    .local p1, "elementMatcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;-><init>()V

    .line 18
    iput-object p1, p0, Lorg/hamcrest/core/IsCollectionContaining;->elementMatcher:Lorg/hamcrest/Matcher;

    .line 19
    return-void
.end method

.method public static hasItem(Ljava/lang/Object;)Lorg/hamcrest/Matcher;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Iterable",
            "<-TT;>;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 77
    .local p0, "item":Ljava/lang/Object;, "TT;"
    new-instance v0, Lorg/hamcrest/core/IsCollectionContaining;

    invoke-static {p0}, Lorg/hamcrest/core/IsEqual;->equalTo(Ljava/lang/Object;)Lorg/hamcrest/Matcher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/hamcrest/core/IsCollectionContaining;-><init>(Lorg/hamcrest/Matcher;)V

    return-object v0
.end method

.method public static hasItem(Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;)",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Iterable",
            "<-TT;>;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 59
    .local p0, "itemMatcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    new-instance v0, Lorg/hamcrest/core/IsCollectionContaining;

    invoke-direct {v0, p0}, Lorg/hamcrest/core/IsCollectionContaining;-><init>(Lorg/hamcrest/Matcher;)V

    return-object v0
.end method

.method public static varargs hasItems([Ljava/lang/Object;)Lorg/hamcrest/Matcher;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Iterable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 118
    .local p0, "items":[Ljava/lang/Object;, "[TT;"
    new-instance v0, Ljava/util/ArrayList;

    array-length v5, p0

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 119
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Lorg/hamcrest/Matcher<-Ljava/lang/Iterable<TT;>;>;>;"
    move-object v1, p0

    .local v1, "arr$":[Ljava/lang/Object;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_17

    aget-object v2, v1, v3

    .line 120
    .local v2, "element":Ljava/lang/Object;, "TT;"
    invoke-static {v2}, Lorg/hamcrest/core/IsCollectionContaining;->hasItem(Ljava/lang/Object;)Lorg/hamcrest/Matcher;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 123
    .end local v2    # "element":Ljava/lang/Object;, "TT;"
    :cond_17
    invoke-static {v0}, Lorg/hamcrest/core/AllOf;->allOf(Ljava/lang/Iterable;)Lorg/hamcrest/Matcher;

    move-result-object v5

    return-object v5
.end method

.method public static varargs hasItems([Lorg/hamcrest/Matcher;)Lorg/hamcrest/Matcher;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;)",
            "Lorg/hamcrest/Matcher",
            "<",
            "Ljava/lang/Iterable",
            "<TT;>;>;"
        }
    .end annotation

    .annotation runtime Lorg/hamcrest/Factory;
    .end annotation

    .prologue
    .line 94
    .local p0, "itemMatchers":[Lorg/hamcrest/Matcher;, "[Lorg/hamcrest/Matcher<-TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    array-length v5, p0

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    .local v0, "all":Ljava/util/List;, "Ljava/util/List<Lorg/hamcrest/Matcher<-Ljava/lang/Iterable<TT;>;>;>;"
    move-object v1, p0

    .local v1, "arr$":[Lorg/hamcrest/Matcher;
    array-length v4, v1

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_18

    aget-object v2, v1, v3

    .line 98
    .local v2, "elementMatcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    new-instance v5, Lorg/hamcrest/core/IsCollectionContaining;

    invoke-direct {v5, v2}, Lorg/hamcrest/core/IsCollectionContaining;-><init>(Lorg/hamcrest/Matcher;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 101
    .end local v2    # "elementMatcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    :cond_18
    invoke-static {v0}, Lorg/hamcrest/core/AllOf;->allOf(Ljava/lang/Iterable;)Lorg/hamcrest/Matcher;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 39
    .local p0, "this":Lorg/hamcrest/core/IsCollectionContaining;, "Lorg/hamcrest/core/IsCollectionContaining<TT;>;"
    const-string v0, "a collection containing "

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/core/IsCollectionContaining;->elementMatcher:Lorg/hamcrest/Matcher;

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 42
    return-void
.end method

.method protected matchesSafely(Ljava/lang/Iterable;Lorg/hamcrest/Description;)Z
    .registers 7
    .param p2, "mismatchDescription"    # Lorg/hamcrest/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<-TT;>;",
            "Lorg/hamcrest/Description;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lorg/hamcrest/core/IsCollectionContaining;, "Lorg/hamcrest/core/IsCollectionContaining<TT;>;"
    .local p1, "collection":Ljava/lang/Iterable;, "Ljava/lang/Iterable<-TT;>;"
    const/4 v1, 0x0

    .line 24
    .local v1, "isPastFirst":Z
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 25
    .local v2, "item":Ljava/lang/Object;
    iget-object v3, p0, Lorg/hamcrest/core/IsCollectionContaining;->elementMatcher:Lorg/hamcrest/Matcher;

    invoke-interface {v3, v2}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 26
    const/4 v3, 0x1

    .line 34
    .end local v2    # "item":Ljava/lang/Object;
    :goto_18
    return v3

    .line 28
    .restart local v2    # "item":Ljava/lang/Object;
    :cond_19
    if-eqz v1, :cond_20

    .line 29
    const-string v3, ", "

    invoke-interface {p2, v3}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 31
    :cond_20
    iget-object v3, p0, Lorg/hamcrest/core/IsCollectionContaining;->elementMatcher:Lorg/hamcrest/Matcher;

    invoke-interface {v3, v2, p2}, Lorg/hamcrest/Matcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 32
    const/4 v1, 0x1

    goto :goto_5

    .line 34
    .end local v2    # "item":Ljava/lang/Object;
    :cond_27
    const/4 v3, 0x0

    goto :goto_18
.end method

.method protected bridge synthetic matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Lorg/hamcrest/Description;

    .prologue
    .line 14
    .local p0, "this":Lorg/hamcrest/core/IsCollectionContaining;, "Lorg/hamcrest/core/IsCollectionContaining<TT;>;"
    check-cast p1, Ljava/lang/Iterable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/core/IsCollectionContaining;->matchesSafely(Ljava/lang/Iterable;Lorg/hamcrest/Description;)Z

    move-result v0

    return v0
.end method
