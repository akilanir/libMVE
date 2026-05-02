.class Lorg/junit/experimental/results/ResultMatchers$1;
.super Lorg/hamcrest/TypeSafeMatcher;
.source "ResultMatchers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/results/ResultMatchers;->failureCountIs(I)Lorg/hamcrest/Matcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/hamcrest/TypeSafeMatcher",
        "<",
        "Lorg/junit/experimental/results/PrintableResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$count:I


# direct methods
.method constructor <init>(I)V
    .registers 2

    .prologue
    .line 34
    iput p1, p0, Lorg/junit/experimental/results/ResultMatchers$1;->val$count:I

    invoke-direct {p0}, Lorg/hamcrest/TypeSafeMatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "has "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/junit/experimental/results/ResultMatchers$1;->val$count:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " failures"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 31
    return-void
.end method

.method public bridge synthetic matchesSafely(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 34
    check-cast p1, Lorg/junit/experimental/results/PrintableResult;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/junit/experimental/results/ResultMatchers$1;->matchesSafely(Lorg/junit/experimental/results/PrintableResult;)Z

    move-result v0

    return v0
.end method

.method public matchesSafely(Lorg/junit/experimental/results/PrintableResult;)Z
    .registers 4
    .param p1, "item"    # Lorg/junit/experimental/results/PrintableResult;

    .prologue
    .line 35
    invoke-virtual {p1}, Lorg/junit/experimental/results/PrintableResult;->failureCount()I

    move-result v0

    iget v1, p0, Lorg/junit/experimental/results/ResultMatchers$1;->val$count:I

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
