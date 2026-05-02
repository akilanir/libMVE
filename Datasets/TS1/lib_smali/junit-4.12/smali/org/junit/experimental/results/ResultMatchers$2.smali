.class Lorg/junit/experimental/results/ResultMatchers$2;
.super Lorg/hamcrest/BaseMatcher;
.source "ResultMatchers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/results/ResultMatchers;->hasSingleFailureContaining(Ljava/lang/String;)Lorg/hamcrest/Matcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/hamcrest/BaseMatcher",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 49
    iput-object p1, p0, Lorg/junit/experimental/results/ResultMatchers$2;->val$string:Ljava/lang/String;

    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    return-void
.end method


# virtual methods
.method public describeTo(Lorg/hamcrest/Description;)V
    .registers 4
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "has single failure containing "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/experimental/results/ResultMatchers$2;->val$string:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 51
    return-void
.end method

.method public matches(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/junit/experimental/results/ResultMatchers$2;->val$string:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-static {v0}, Lorg/junit/experimental/results/ResultMatchers;->failureCountIs(I)Lorg/hamcrest/Matcher;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/hamcrest/Matcher;->matches(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method
