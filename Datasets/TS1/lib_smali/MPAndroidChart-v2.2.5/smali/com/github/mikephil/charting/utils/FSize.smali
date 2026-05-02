.class public final Lcom/github/mikephil/charting/utils/FSize;
.super Ljava/lang/Object;
.source "FSize.java"


# instance fields
.field public final height:F

.field public final width:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    .line 15
    iput p2, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    .line 16
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 20
    if-nez p1, :cond_5

    .line 30
    :cond_4
    :goto_4
    return v2

    .line 23
    :cond_5
    if-ne p0, p1, :cond_9

    move v2, v1

    .line 24
    goto :goto_4

    .line 26
    :cond_9
    instance-of v3, p1, Lcom/github/mikephil/charting/utils/FSize;

    if-eqz v3, :cond_4

    move-object v0, p1

    .line 27
    check-cast v0, Lcom/github/mikephil/charting/utils/FSize;

    .line 28
    .local v0, "other":Lcom/github/mikephil/charting/utils/FSize;
    iget v3, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    iget v4, v0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_22

    iget v3, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    iget v4, v0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_22

    :goto_20
    move v2, v1

    goto :goto_4

    :cond_22
    move v1, v2

    goto :goto_20
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 43
    iget v0, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    iget v1, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/github/mikephil/charting/utils/FSize;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/github/mikephil/charting/utils/FSize;->height:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
