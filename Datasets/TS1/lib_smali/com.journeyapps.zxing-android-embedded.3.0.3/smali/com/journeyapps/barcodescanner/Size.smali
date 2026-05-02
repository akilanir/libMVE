.class public Lcom/journeyapps/barcodescanner/Size;
.super Ljava/lang/Object;
.source "Size.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/journeyapps/barcodescanner/Size;",
        ">;"
    }
.end annotation


# instance fields
.field public final height:I

.field public final width:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    .line 12
    iput p2, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    .line 13
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/journeyapps/barcodescanner/Size;)I
    .registers 6
    .param p1, "other"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 51
    iget v2, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget v3, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    mul-int v0, v2, v3

    .line 52
    .local v0, "aPixels":I
    iget v2, p1, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget v3, p1, Lcom/journeyapps/barcodescanner/Size;->width:I

    mul-int v1, v2, v3

    .line 53
    .local v1, "bPixels":I
    if-ge v1, v0, :cond_10

    .line 54
    const/4 v2, 0x1

    .line 59
    :goto_f
    return v2

    .line 56
    :cond_10
    if-le v1, v0, :cond_14

    .line 57
    const/4 v2, -0x1

    goto :goto_f

    .line 59
    :cond_14
    const/4 v2, 0x0

    goto :goto_f
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 6
    check-cast p1, Lcom/journeyapps/barcodescanner/Size;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/journeyapps/barcodescanner/Size;->compareTo(Lcom/journeyapps/barcodescanner/Size;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 68
    if-ne p0, p1, :cond_5

    .line 74
    :cond_4
    :goto_4
    return v1

    .line 69
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 71
    check-cast v0, Lcom/journeyapps/barcodescanner/Size;

    .line 73
    .local v0, "size":Lcom/journeyapps/barcodescanner/Size;
    iget v3, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget v4, v0, Lcom/journeyapps/barcodescanner/Size;->width:I

    if-eq v3, v4, :cond_1e

    move v1, v2

    goto :goto_4

    .line 74
    :cond_1e
    iget v3, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget v4, v0, Lcom/journeyapps/barcodescanner/Size;->height:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public fitsIn(Lcom/journeyapps/barcodescanner/Size;)Z
    .registers 4
    .param p1, "other"    # Lcom/journeyapps/barcodescanner/Size;

    .prologue
    .line 43
    iget v0, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    iget v1, p1, Lcom/journeyapps/barcodescanner/Size;->width:I

    if-gt v0, v1, :cond_e

    iget v0, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget v1, p1, Lcom/journeyapps/barcodescanner/Size;->height:I

    if-gt v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 80
    iget v0, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    .line 81
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    add-int v0, v1, v2

    .line 82
    return v0
.end method

.method public rotate()Lcom/journeyapps/barcodescanner/Size;
    .registers 4

    .prologue
    .line 22
    new-instance v0, Lcom/journeyapps/barcodescanner/Size;

    iget v1, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    iget v2, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    invoke-direct {v0, v1, v2}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    return-object v0
.end method

.method public scale(II)Lcom/journeyapps/barcodescanner/Size;
    .registers 6
    .param p1, "n"    # I
    .param p2, "d"    # I

    .prologue
    .line 33
    new-instance v0, Lcom/journeyapps/barcodescanner/Size;

    iget v1, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    mul-int/2addr v1, p1

    div-int/2addr v1, p2

    iget v2, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    mul-int/2addr v2, p1

    div-int/2addr v2, p2

    invoke-direct {v0, v1, v2}, Lcom/journeyapps/barcodescanner/Size;-><init>(II)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/journeyapps/barcodescanner/Size;->width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/journeyapps/barcodescanner/Size;->height:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
