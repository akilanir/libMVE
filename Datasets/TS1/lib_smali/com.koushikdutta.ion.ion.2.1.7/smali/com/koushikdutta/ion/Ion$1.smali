.class final Lcom/koushikdutta/ion/Ion$1;
.super Ljava/lang/Object;
.source "Ion.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/Ion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/koushikdutta/ion/DeferredLoadBitmap;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 256
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/koushikdutta/ion/DeferredLoadBitmap;Lcom/koushikdutta/ion/DeferredLoadBitmap;)I
    .registers 5
    .param p1, "lhs"    # Lcom/koushikdutta/ion/DeferredLoadBitmap;
    .param p2, "rhs"    # Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .prologue
    .line 260
    iget v0, p1, Lcom/koushikdutta/ion/DeferredLoadBitmap;->priority:I

    iget v1, p2, Lcom/koushikdutta/ion/DeferredLoadBitmap;->priority:I

    if-ne v0, v1, :cond_8

    .line 261
    const/4 v0, 0x0

    .line 264
    :goto_7
    return v0

    .line 262
    :cond_8
    iget v0, p1, Lcom/koushikdutta/ion/DeferredLoadBitmap;->priority:I

    iget v1, p2, Lcom/koushikdutta/ion/DeferredLoadBitmap;->priority:I

    if-ge v0, v1, :cond_10

    .line 263
    const/4 v0, 0x1

    goto :goto_7

    .line 264
    :cond_10
    const/4 v0, -0x1

    goto :goto_7
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 256
    check-cast p1, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/ion/Ion$1;->compare(Lcom/koushikdutta/ion/DeferredLoadBitmap;Lcom/koushikdutta/ion/DeferredLoadBitmap;)I

    move-result v0

    return v0
.end method
