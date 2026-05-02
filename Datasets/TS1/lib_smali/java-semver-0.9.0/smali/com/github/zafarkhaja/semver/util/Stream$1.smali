.class Lcom/github/zafarkhaja/semver/util/Stream$1;
.super Ljava/lang/Object;
.source "Stream.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/zafarkhaja/semver/util/Stream;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private index:I

.field final synthetic this$0:Lcom/github/zafarkhaja/semver/util/Stream;


# direct methods
.method constructor <init>(Lcom/github/zafarkhaja/semver/util/Stream;)V
    .registers 3
    .param p1, "this$0"    # Lcom/github/zafarkhaja/semver/util/Stream;

    .prologue
    .line 244
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream$1;, "Lcom/github/zafarkhaja/semver/util/Stream.1;"
    iput-object p1, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->this$0:Lcom/github/zafarkhaja/semver/util/Stream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 254
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->this$0:Lcom/github/zafarkhaja/semver/util/Stream;

    # getter for: Lcom/github/zafarkhaja/semver/util/Stream;->offset:I
    invoke-static {v0}, Lcom/github/zafarkhaja/semver/util/Stream;->access$000(Lcom/github/zafarkhaja/semver/util/Stream;)I

    move-result v0

    iput v0, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 261
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream$1;, "Lcom/github/zafarkhaja/semver/util/Stream.1;"
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->index:I

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->this$0:Lcom/github/zafarkhaja/semver/util/Stream;

    # getter for: Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/github/zafarkhaja/semver/util/Stream;->access$100(Lcom/github/zafarkhaja/semver/util/Stream;)[Ljava/lang/Object;

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_d

    const/4 v0, 0x1

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream$1;, "Lcom/github/zafarkhaja/semver/util/Stream.1;"
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->index:I

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->this$0:Lcom/github/zafarkhaja/semver/util/Stream;

    # getter for: Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;
    invoke-static {v1}, Lcom/github/zafarkhaja/semver/util/Stream;->access$100(Lcom/github/zafarkhaja/semver/util/Stream;)[Ljava/lang/Object;

    move-result-object v1

    array-length v1, v1

    if-lt v0, v1, :cond_11

    .line 270
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 272
    :cond_11
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->this$0:Lcom/github/zafarkhaja/semver/util/Stream;

    # getter for: Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;
    invoke-static {v0}, Lcom/github/zafarkhaja/semver/util/Stream;->access$100(Lcom/github/zafarkhaja/semver/util/Stream;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/github/zafarkhaja/semver/util/Stream$1;->index:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 280
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream$1;, "Lcom/github/zafarkhaja/semver/util/Stream.1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
