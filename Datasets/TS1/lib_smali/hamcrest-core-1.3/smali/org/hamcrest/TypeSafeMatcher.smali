.class public abstract Lorg/hamcrest/TypeSafeMatcher;
.super Lorg/hamcrest/BaseMatcher;
.source "TypeSafeMatcher.java"


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


# static fields
.field private static final TYPE_FINDER:Lorg/hamcrest/internal/ReflectiveTypeFinder;


# instance fields
.field private final expectedType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 14
    new-instance v0, Lorg/hamcrest/internal/ReflectiveTypeFinder;

    const-string v1, "matchesSafely"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/hamcrest/internal/ReflectiveTypeFinder;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/hamcrest/TypeSafeMatcher;->TYPE_FINDER:Lorg/hamcrest/internal/ReflectiveTypeFinder;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 22
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    sget-object v0, Lorg/hamcrest/TypeSafeMatcher;->TYPE_FINDER:Lorg/hamcrest/internal/ReflectiveTypeFinder;

    invoke-direct {p0, v0}, Lorg/hamcrest/TypeSafeMatcher;-><init>(Lorg/hamcrest/internal/ReflectiveTypeFinder;)V

    .line 23
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    .local p1, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/hamcrest/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    .line 32
    return-void
.end method

.method protected constructor <init>(Lorg/hamcrest/internal/ReflectiveTypeFinder;)V
    .registers 3
    .param p1, "typeFinder"    # Lorg/hamcrest/internal/ReflectiveTypeFinder;

    .prologue
    .line 39
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 40
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/hamcrest/internal/ReflectiveTypeFinder;->findExpectedType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/hamcrest/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    .line 41
    return-void
.end method


# virtual methods
.method public final describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .registers 5
    .param p1, "item"    # Ljava/lang/Object;
    .param p2, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 73
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    if-nez p1, :cond_6

    .line 74
    invoke-super {p0, p1, p2}, Lorg/hamcrest/BaseMatcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 84
    :goto_5
    return-void

    .line 75
    :cond_6
    iget-object v0, p0, Lorg/hamcrest/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 76
    const-string v0, "was a "

    invoke-interface {p2, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    const-string v1, " ("

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/hamcrest/Description;->appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;

    move-result-object v0

    const-string v1, ")"

    invoke-interface {v0, v1}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    goto :goto_5

    .line 82
    :cond_30
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/TypeSafeMatcher;->describeMismatchSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    goto :goto_5
.end method

.method protected describeMismatchSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .registers 3
    .param p2, "mismatchDescription"    # Lorg/hamcrest/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/hamcrest/Description;",
            ")V"
        }
    .end annotation

    .prologue
    .line 54
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    invoke-super {p0, p1, p2}, Lorg/hamcrest/BaseMatcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 55
    return-void
.end method

.method public final matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 65
    .local p0, "this":Lorg/hamcrest/TypeSafeMatcher;, "Lorg/hamcrest/TypeSafeMatcher<TT;>;"
    if-eqz p1, :cond_12

    iget-object v0, p0, Lorg/hamcrest/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0, p1}, Lorg/hamcrest/TypeSafeMatcher;->matchesSafely(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method protected abstract matchesSafely(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
