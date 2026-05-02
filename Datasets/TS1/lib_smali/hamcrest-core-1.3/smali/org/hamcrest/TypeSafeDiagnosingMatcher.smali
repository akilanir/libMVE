.class public abstract Lorg/hamcrest/TypeSafeDiagnosingMatcher;
.super Lorg/hamcrest/BaseMatcher;
.source "TypeSafeDiagnosingMatcher.java"


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
    .line 18
    new-instance v0, Lorg/hamcrest/internal/ReflectiveTypeFinder;

    const-string v1, "matchesSafely"

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lorg/hamcrest/internal/ReflectiveTypeFinder;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->TYPE_FINDER:Lorg/hamcrest/internal/ReflectiveTypeFinder;

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 49
    .local p0, "this":Lorg/hamcrest/TypeSafeDiagnosingMatcher;, "Lorg/hamcrest/TypeSafeDiagnosingMatcher<TT;>;"
    sget-object v0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->TYPE_FINDER:Lorg/hamcrest/internal/ReflectiveTypeFinder;

    invoke-direct {p0, v0}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;-><init>(Lorg/hamcrest/internal/ReflectiveTypeFinder;)V

    .line 50
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
    .line 32
    .local p0, "this":Lorg/hamcrest/TypeSafeDiagnosingMatcher;, "Lorg/hamcrest/TypeSafeDiagnosingMatcher<TT;>;"
    .local p1, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 33
    iput-object p1, p0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->expectedType:Ljava/lang/Class;

    .line 34
    return-void
.end method

.method protected constructor <init>(Lorg/hamcrest/internal/ReflectiveTypeFinder;)V
    .registers 3
    .param p1, "typeFinder"    # Lorg/hamcrest/internal/ReflectiveTypeFinder;

    .prologue
    .line 41
    .local p0, "this":Lorg/hamcrest/TypeSafeDiagnosingMatcher;, "Lorg/hamcrest/TypeSafeDiagnosingMatcher<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 42
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/hamcrest/internal/ReflectiveTypeFinder;->findExpectedType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->expectedType:Ljava/lang/Class;

    .line 43
    return-void
.end method


# virtual methods
.method public final describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "item"    # Ljava/lang/Object;
    .param p2, "mismatchDescription"    # Lorg/hamcrest/Description;

    .prologue
    .line 63
    .local p0, "this":Lorg/hamcrest/TypeSafeDiagnosingMatcher;, "Lorg/hamcrest/TypeSafeDiagnosingMatcher<TT;>;"
    if-eqz p1, :cond_a

    iget-object v0, p0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->expectedType:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 64
    :cond_a
    invoke-super {p0, p1, p2}, Lorg/hamcrest/BaseMatcher;->describeMismatch(Ljava/lang/Object;Lorg/hamcrest/Description;)V

    .line 68
    :goto_d
    return-void

    .line 66
    :cond_e
    invoke-virtual {p0, p1, p2}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z

    goto :goto_d
.end method

.method public final matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 55
    .local p0, "this":Lorg/hamcrest/TypeSafeDiagnosingMatcher;, "Lorg/hamcrest/TypeSafeDiagnosingMatcher<TT;>;"
    if-eqz p1, :cond_17

    iget-object v0, p0, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->expectedType:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    new-instance v0, Lorg/hamcrest/Description$NullDescription;

    invoke-direct {v0}, Lorg/hamcrest/Description$NullDescription;-><init>()V

    invoke-virtual {p0, p1, v0}, Lorg/hamcrest/TypeSafeDiagnosingMatcher;->matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method protected abstract matchesSafely(Ljava/lang/Object;Lorg/hamcrest/Description;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lorg/hamcrest/Description;",
            ")Z"
        }
    .end annotation
.end method
