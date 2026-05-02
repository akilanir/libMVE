.class abstract Lorg/hamcrest/core/ShortcutCombination;
.super Lorg/hamcrest/BaseMatcher;
.source "ShortcutCombination.java"


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
.field private final matchers:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable",
            "<",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/hamcrest/Matcher",
            "<-TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p0, "this":Lorg/hamcrest/core/ShortcutCombination;, "Lorg/hamcrest/core/ShortcutCombination<TT;>;"
    .local p1, "matchers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lorg/hamcrest/Matcher<-TT;>;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/hamcrest/core/ShortcutCombination;->matchers:Ljava/lang/Iterable;

    .line 13
    return-void
.end method


# virtual methods
.method public abstract describeTo(Lorg/hamcrest/Description;)V
.end method

.method public describeTo(Lorg/hamcrest/Description;Ljava/lang/String;)V
    .registers 7
    .param p1, "description"    # Lorg/hamcrest/Description;
    .param p2, "operator"    # Ljava/lang/String;

    .prologue
    .line 31
    .local p0, "this":Lorg/hamcrest/core/ShortcutCombination;, "Lorg/hamcrest/core/ShortcutCombination<TT;>;"
    const-string v0, "("

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ")"

    iget-object v3, p0, Lorg/hamcrest/core/ShortcutCombination;->matchers:Ljava/lang/Iterable;

    invoke-interface {p1, v0, v1, v2, v3}, Lorg/hamcrest/Description;->appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;

    .line 32
    return-void
.end method

.method public abstract matches(Ljava/lang/Object;)Z
.end method

.method protected matches(Ljava/lang/Object;Z)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;
    .param p2, "shortcut"    # Z

    .prologue
    .line 22
    .local p0, "this":Lorg/hamcrest/core/ShortcutCombination;, "Lorg/hamcrest/core/ShortcutCombination<TT;>;"
    iget-object v2, p0, Lorg/hamcrest/core/ShortcutCombination;->matchers:Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/hamcrest/Matcher;

    .line 23
    .local v1, "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    invoke-interface {v1, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v2

    if-ne v2, p2, :cond_6

    .line 27
    .end local v1    # "matcher":Lorg/hamcrest/Matcher;, "Lorg/hamcrest/Matcher<-TT;>;"
    .end local p2    # "shortcut":Z
    :goto_18
    return p2

    .restart local p2    # "shortcut":Z
    :cond_19
    if-nez p2, :cond_1e

    const/4 v2, 0x1

    :goto_1c
    move p2, v2

    goto :goto_18

    :cond_1e
    const/4 v2, 0x0

    goto :goto_1c
.end method
