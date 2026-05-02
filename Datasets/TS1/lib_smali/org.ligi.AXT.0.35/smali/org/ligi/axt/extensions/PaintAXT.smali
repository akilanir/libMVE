.class public Lorg/ligi/axt/extensions/PaintAXT;
.super Ljava/lang/Object;
.source "PaintAXT.java"


# instance fields
.field final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/graphics/Paint;)V
    .registers 2
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lorg/ligi/axt/extensions/PaintAXT;->paint:Landroid/graphics/Paint;

    .line 11
    return-void
.end method


# virtual methods
.method public getTextWidth(Ljava/lang/String;)F
    .registers 6
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    new-array v2, v3, [F

    .line 21
    .local v2, "widths":[F
    iget-object v3, p0, Lorg/ligi/axt/extensions/PaintAXT;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3, p1, v2}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 22
    const/4 v1, 0x0

    .line 23
    .local v1, "res":F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    array-length v3, v2

    if-ge v0, v3, :cond_16

    .line 24
    aget v3, v2, v0

    add-float/2addr v1, v3

    .line 23
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    .line 27
    :cond_16
    return v1
.end method
