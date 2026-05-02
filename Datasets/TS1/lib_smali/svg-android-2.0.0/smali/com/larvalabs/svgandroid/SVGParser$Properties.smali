.class Lcom/larvalabs/svgandroid/SVGParser$Properties;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Properties"
.end annotation


# instance fields
.field atts:Lorg/xml/sax/Attributes;

.field styles:Lcom/larvalabs/svgandroid/SVGParser$StyleSet;


# direct methods
.method private constructor <init>(Lorg/xml/sax/Attributes;)V
    .registers 5
    .param p1, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    const/4 v2, 0x0

    .line 708
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 705
    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->styles:Lcom/larvalabs/svgandroid/SVGParser$StyleSet;

    .line 709
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->atts:Lorg/xml/sax/Attributes;

    .line 710
    const-string v1, "style"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v1, p1}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v0

    .line 711
    .local v0, "styleAttr":Ljava/lang/String;
    if-eqz v0, :cond_17

    .line 712
    new-instance v1, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;

    invoke-direct {v1, v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;-><init>(Ljava/lang/String;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    iput-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->styles:Lcom/larvalabs/svgandroid/SVGParser$StyleSet;

    .line 714
    :cond_17
    return-void
.end method

.method synthetic constructor <init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/xml/sax/Attributes;
    .param p2, "x1"    # Lcom/larvalabs/svgandroid/SVGParser$1;

    .prologue
    .line 704
    invoke-direct {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;)V

    return-void
.end method

.method private hex3Tohex6(I)I
    .registers 4
    .param p1, "x"    # I

    .prologue
    .line 770
    and-int/lit16 v0, p1, 0xf00

    shl-int/lit8 v0, v0, 0x8

    and-int/lit16 v1, p1, 0xf00

    shl-int/lit8 v1, v1, 0xc

    or-int/2addr v0, v1

    and-int/lit16 v1, p1, 0xf0

    shl-int/lit8 v1, v1, 0x4

    or-int/2addr v0, v1

    and-int/lit16 v1, p1, 0xf0

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit8 v1, p1, 0xf

    shl-int/lit8 v1, v1, 0x4

    or-int/2addr v0, v1

    and-int/lit8 v1, p1, 0xf

    or-int/2addr v0, v1

    return v0
.end method

.method private parseNum(Ljava/lang/String;)I
    .registers 4
    .param p1, "v"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 736
    const-string v0, "%"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 737
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 738
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 740
    :goto_21
    return v0

    :cond_22
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_21
.end method

.method private rgb(III)Ljava/lang/Integer;
    .registers 6
    .param p1, "r"    # I
    .param p2, "g"    # I
    .param p3, "b"    # I

    .prologue
    .line 732
    and-int/lit16 v0, p1, 0xff

    shl-int/lit8 v0, v0, 0x10

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, p3, 0xff

    or-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAttr(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 717
    const/4 v0, 0x0

    .line 718
    .local v0, "v":Ljava/lang/String;
    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->styles:Lcom/larvalabs/svgandroid/SVGParser$StyleSet;

    if-eqz v1, :cond_b

    .line 719
    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->styles:Lcom/larvalabs/svgandroid/SVGParser$StyleSet;

    invoke-virtual {v1, p1}, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;->getStyle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 721
    :cond_b
    if-nez v0, :cond_13

    .line 722
    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Properties;->atts:Lorg/xml/sax/Attributes;

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {p1, v1}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v0

    .line 724
    :cond_13
    return-object v0
.end method

.method public getColor(Ljava/lang/String;)Ljava/lang/Integer;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x4

    const/4 v5, 0x0

    .line 744
    invoke-virtual {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getAttr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 745
    .local v3, "v":Ljava/lang/String;
    if-nez v3, :cond_9

    .line 764
    :goto_8
    return-object v5

    .line 747
    :cond_9
    const-string v6, "#"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 749
    const/4 v6, 0x1

    :try_start_12
    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x10

    invoke-static {v6, v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 750
    .local v0, "c":I
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v8, :cond_26

    invoke-direct {p0, v0}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->hex3Tohex6(I)I

    move-result v0

    .end local v0    # "c":I
    :cond_26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_29
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_29} :catch_2b

    move-result-object v5

    goto :goto_8

    .line 751
    :catch_2b
    move-exception v2

    .line 752
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_8

    .line 754
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_2d
    const-string v6, "rgb("

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6b

    const-string v6, ")"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6b

    .line 755
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 757
    .local v4, "values":[Ljava/lang/String;
    const/4 v6, 0x0

    :try_start_4e
    aget-object v6, v4, v6

    invoke-direct {p0, v6}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->parseNum(Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x1

    aget-object v7, v4, v7

    invoke-direct {p0, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->parseNum(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x2

    aget-object v8, v4, v8

    invoke-direct {p0, v8}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->parseNum(Ljava/lang/String;)I

    move-result v8

    invoke-direct {p0, v6, v7, v8}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->rgb(III)Ljava/lang/Integer;
    :try_end_65
    .catch Ljava/lang/NumberFormatException; {:try_start_4e .. :try_end_65} :catch_67
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4e .. :try_end_65} :catch_69

    move-result-object v5

    goto :goto_8

    .line 758
    :catch_67
    move-exception v2

    .line 759
    .restart local v2    # "nfe":Ljava/lang/NumberFormatException;
    goto :goto_8

    .line 760
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :catch_69
    move-exception v1

    .line 761
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    goto :goto_8

    .line 764
    .end local v1    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    .end local v4    # "values":[Ljava/lang/String;
    :cond_6b
    invoke-static {v3}, Lcom/larvalabs/svgandroid/SVGColors;->mapColour(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    goto :goto_8
.end method

.method public getFloat(Ljava/lang/String;)Ljava/lang/Float;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 784
    invoke-virtual {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getAttr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 785
    .local v1, "v":Ljava/lang/String;
    if-nez v1, :cond_8

    .line 791
    :goto_7
    return-object v2

    .line 789
    :cond_8
    :try_start_8
    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    :try_end_f
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_f} :catch_11

    move-result-object v2

    goto :goto_7

    .line 790
    :catch_11
    move-exception v0

    .line 791
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_7
.end method

.method public getFloat(Ljava/lang/String;F)Ljava/lang/Float;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # F

    .prologue
    .line 775
    invoke-virtual {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .line 776
    .local v0, "v":Ljava/lang/Float;
    if-nez v0, :cond_a

    .line 777
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 779
    .end local v0    # "v":Ljava/lang/Float;
    :cond_a
    return-object v0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 728
    invoke-virtual {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getAttr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
