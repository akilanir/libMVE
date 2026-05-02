.class public Lorg/ligi/axt/extensions/ArrayAXT;
.super Ljava/lang/Object;
.source "ArrayAXT.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final arr:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 7
    .local p0, "this":Lorg/ligi/axt/extensions/ArrayAXT;, "Lorg/ligi/axt/extensions/ArrayAXT<TT;>;"
    .local p1, "arr":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    .line 9
    return-void
.end method


# virtual methods
.method public combineWith([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/ligi/axt/extensions/ArrayAXT;, "Lorg/ligi/axt/extensions/ArrayAXT<TT;>;"
    .local p1, "arr2":[Ljava/lang/Object;, "[TT;"
    const/4 v5, 0x0

    .line 12
    iget-object v3, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    array-length v0, v3

    .line 13
    .local v0, "alen":I
    array-length v1, p1

    .line 15
    .local v1, "blen":I
    iget-object v3, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    .line 16
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    add-int v4, v0, v1

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v2, v3

    check-cast v2, [Ljava/lang/Object;

    .line 17
    .local v2, "result":[Ljava/lang/Object;, "[TT;"
    iget-object v3, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    invoke-static {v3, v5, v2, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    invoke-static {p1, v5, v2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    return-object v2
.end method

.method public last()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lorg/ligi/axt/extensions/ArrayAXT;, "Lorg/ligi/axt/extensions/ArrayAXT<TT;>;"
    iget-object v0, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    iget-object v1, p0, Lorg/ligi/axt/extensions/ArrayAXT;->arr:[Ljava/lang/Object;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method
