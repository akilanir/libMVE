.class public Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;
.super Landroid/text/style/TypefaceSpan;
.source "IconicsTypefaceSpan.java"


# instance fields
.field private final newType:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .registers 3
    .param p1, "family"    # Ljava/lang/String;
    .param p2, "type"    # Landroid/graphics/Typeface;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    .line 29
    iput-object p2, p0, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;->newType:Landroid/graphics/Typeface;

    .line 30
    return-void
.end method

.method private static applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V
    .registers 6
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 44
    invoke-virtual {p0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    .line 45
    .local v1, "old":Landroid/graphics/Typeface;
    if-nez v1, :cond_24

    .line 46
    const/4 v2, 0x0

    .line 51
    .local v2, "oldStyle":I
    :goto_7
    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v3

    xor-int/lit8 v3, v3, -0x1

    and-int v0, v2, v3

    .line 52
    .local v0, "fake":I
    and-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_17

    .line 53
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 56
    :cond_17
    and-int/lit8 v3, v0, 0x2

    if-eqz v3, :cond_20

    .line 57
    const/high16 v3, -0x41800000    # -0.25f

    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 60
    :cond_20
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 61
    return-void

    .line 48
    .end local v0    # "fake":I
    .end local v2    # "oldStyle":I
    :cond_24
    invoke-virtual {v1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v2

    .restart local v2    # "oldStyle":I
    goto :goto_7
.end method


# virtual methods
.method public updateDrawState(Landroid/text/TextPaint;)V
    .registers 3
    .param p1, "ds"    # Landroid/text/TextPaint;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;->newType:Landroid/graphics/Typeface;

    invoke-static {p1, v0}, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 35
    return-void
.end method

.method public updateMeasureState(Landroid/text/TextPaint;)V
    .registers 3
    .param p1, "paint"    # Landroid/text/TextPaint;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;->newType:Landroid/graphics/Typeface;

    invoke-static {p1, v0}, Lcom/mikepenz/iconics/utils/IconicsTypefaceSpan;->applyCustomTypeFace(Landroid/graphics/Paint;Landroid/graphics/Typeface;)V

    .line 40
    return-void
.end method
