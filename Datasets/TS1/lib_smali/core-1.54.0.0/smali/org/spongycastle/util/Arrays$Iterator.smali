.class public Lorg/spongycastle/util/Arrays$Iterator;
.super Ljava/lang/Object;
.source "Arrays.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/util/Arrays;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Iterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final dataArray:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private position:I


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .prologue
    .line 1071
    .local p0, "this":Lorg/spongycastle/util/Arrays$Iterator;, "Lorg/spongycastle/util/Arrays$Iterator<TT;>;"
    .local p1, "dataArray":[Ljava/lang/Object;, "[TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1060
    const/4 v0, 0x0

    iput v0, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    .line 1072
    iput-object p1, p0, Lorg/spongycastle/util/Arrays$Iterator;->dataArray:[Ljava/lang/Object;

    .line 1073
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .prologue
    .line 1077
    .local p0, "this":Lorg/spongycastle/util/Arrays$Iterator;, "Lorg/spongycastle/util/Arrays$Iterator<TT;>;"
    iget v0, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    iget-object v1, p0, Lorg/spongycastle/util/Arrays$Iterator;->dataArray:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 1082
    .local p0, "this":Lorg/spongycastle/util/Arrays$Iterator;, "Lorg/spongycastle/util/Arrays$Iterator<TT;>;"
    iget v0, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    iget-object v1, p0, Lorg/spongycastle/util/Arrays$Iterator;->dataArray:[Ljava/lang/Object;

    array-length v1, v1

    if-ne v0, v1, :cond_22

    .line 1084
    new-instance v0, Ljava/util/NoSuchElementException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Out of elements: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1087
    :cond_22
    iget-object v0, p0, Lorg/spongycastle/util/Arrays$Iterator;->dataArray:[Ljava/lang/Object;

    iget v1, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/util/Arrays$Iterator;->position:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public remove()V
    .registers 3

    .prologue
    .line 1092
    .local p0, "this":Lorg/spongycastle/util/Arrays$Iterator;, "Lorg/spongycastle/util/Arrays$Iterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Cannot remove element from an Array."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
