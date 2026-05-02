.class public Lcom/jjoe64/graphview/DefaultLabelFormatter;
.super Ljava/lang/Object;
.source "DefaultLabelFormatter.java"

# interfaces
.implements Lcom/jjoe64/graphview/LabelFormatter;


# instance fields
.field protected mNumberFormatter:[Ljava/text/NumberFormat;

.field protected mViewport:Lcom/jjoe64/graphview/Viewport;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/text/NumberFormat;

    iput-object v0, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/text/NumberFormat;Ljava/text/NumberFormat;)V
    .registers 5
    .param p1, "xFormat"    # Ljava/text/NumberFormat;
    .param p2, "yFormat"    # Ljava/text/NumberFormat;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/text/NumberFormat;

    iput-object v0, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    .line 64
    iget-object v0, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    .line 65
    iget-object v0, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 66
    return-void
.end method


# virtual methods
.method public formatLabel(DZ)Ljava/lang/String;
    .registers 15
    .param p1, "value"    # D
    .param p3, "isValueX"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 86
    if-eqz p3, :cond_3f

    move v2, v5

    .line 87
    .local v2, "i":I
    :goto_5
    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v7, v7, v2

    if-nez v7, :cond_36

    .line 88
    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v8

    aput-object v8, v7, v2

    .line 89
    if-eqz p3, :cond_41

    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v7, v6}, Lcom/jjoe64/graphview/Viewport;->getMaxX(Z)D

    move-result-wide v0

    .line 90
    .local v0, "highestvalue":D
    :goto_1b
    if-eqz p3, :cond_48

    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v7, v6}, Lcom/jjoe64/graphview/Viewport;->getMinX(Z)D

    move-result-wide v3

    .line 91
    .local v3, "lowestvalue":D
    :goto_23
    sub-double v7, v0, v3

    const-wide v9, 0x3fb999999999999aL    # 0.1

    cmpg-double v7, v7, v9

    if-gez v7, :cond_4f

    .line 92
    iget-object v5, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v5, v5, v2

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 103
    .end local v0    # "highestvalue":D
    .end local v3    # "lowestvalue":D
    :cond_36
    :goto_36
    iget-object v5, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v5, v5, v2

    invoke-virtual {v5, p1, p2}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    move-result-object v5

    return-object v5

    .end local v2    # "i":I
    :cond_3f
    move v2, v6

    .line 86
    goto :goto_5

    .line 89
    .restart local v2    # "i":I
    :cond_41
    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v7, v6}, Lcom/jjoe64/graphview/Viewport;->getMaxY(Z)D

    move-result-wide v0

    goto :goto_1b

    .line 90
    .restart local v0    # "highestvalue":D
    :cond_48
    iget-object v7, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    invoke-virtual {v7, v6}, Lcom/jjoe64/graphview/Viewport;->getMinY(Z)D

    move-result-wide v3

    goto :goto_23

    .line 93
    .restart local v3    # "lowestvalue":D
    :cond_4f
    sub-double v7, v0, v3

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    cmpg-double v7, v7, v9

    if-gez v7, :cond_60

    .line 94
    iget-object v5, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v5, v5, v2

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    goto :goto_36

    .line 95
    :cond_60
    sub-double v7, v0, v3

    const-wide/high16 v9, 0x4034000000000000L    # 20.0

    cmpg-double v7, v7, v9

    if-gez v7, :cond_71

    .line 96
    iget-object v5, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v5, v5, v2

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    goto :goto_36

    .line 97
    :cond_71
    sub-double v7, v0, v3

    const-wide/high16 v9, 0x4059000000000000L    # 100.0

    cmpg-double v7, v7, v9

    if-gez v7, :cond_81

    .line 98
    iget-object v6, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v6, v6, v2

    invoke-virtual {v6, v5}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    goto :goto_36

    .line 100
    :cond_81
    iget-object v5, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mNumberFormatter:[Ljava/text/NumberFormat;

    aget-object v5, v5, v2

    invoke-virtual {v5, v6}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    goto :goto_36
.end method

.method public setViewport(Lcom/jjoe64/graphview/Viewport;)V
    .registers 2
    .param p1, "viewport"    # Lcom/jjoe64/graphview/Viewport;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/jjoe64/graphview/DefaultLabelFormatter;->mViewport:Lcom/jjoe64/graphview/Viewport;

    .line 74
    return-void
.end method
