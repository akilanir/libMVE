.class public abstract Lcom/github/mikephil/charting/data/BaseDataSet;
.super Ljava/lang/Object;
.source "BaseDataSet.java"

# interfaces
.implements Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

.field protected mColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected mDrawValues:Z

.field protected mHighlightEnabled:Z

.field private mLabel:Ljava/lang/String;

.field protected mValueColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected transient mValueFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

.field protected mValueTextSize:F

.field protected mValueTypeface:Landroid/graphics/Typeface;

.field protected mVisible:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 32
    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    .line 37
    const-string v0, "DataSet"

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mLabel:Ljava/lang/String;

    .line 42
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 47
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mHighlightEnabled:Z

    .line 62
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mDrawValues:Z

    .line 67
    const/high16 v0, 0x41880000    # 17.0f

    iput v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueTextSize:F

    .line 72
    iput-boolean v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mVisible:Z

    .line 78
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    .line 82
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    const/16 v1, 0x8c

    const/16 v2, 0xea

    const/16 v3, 0xff

    invoke-static {v1, v2, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    const/high16 v1, -0x1000000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 92
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;-><init>()V

    .line 93
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mLabel:Ljava/lang/String;

    .line 94
    return-void
.end method


# virtual methods
.method public addColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 182
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    if-nez v0, :cond_b

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 184
    :cond_b
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    return-void
.end method

.method public contains(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 375
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    .local p1, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryCount()I

    move-result v1

    if-ge v0, v1, :cond_16

    .line 376
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 377
    const/4 v1, 0x1

    .line 380
    :goto_12
    return v1

    .line 375
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 380
    :cond_16
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;
    .registers 2

    .prologue
    .line 329
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    return-object v0
.end method

.method public getColor()I
    .registers 3

    .prologue
    .line 117
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getColor(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 122
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getColors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    return-object v0
.end method

.method public getIndexInEntries(I)I
    .registers 4
    .param p1, "xIndex"    # I

    .prologue
    .line 343
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryCount()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 344
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v1

    if-ne p1, v1, :cond_12

    .line 348
    .end local v0    # "i":I
    :goto_11
    return v0

    .line 343
    .restart local v0    # "i":I
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 348
    :cond_15
    const/4 v0, -0x1

    goto :goto_11
.end method

.method public getLabel()Ljava/lang/String;
    .registers 2

    .prologue
    .line 237
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mLabel:Ljava/lang/String;

    return-object v0
.end method

.method public getValueColors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    return-object v0
.end method

.method public getValueFormatter()Lcom/github/mikephil/charting/formatter/ValueFormatter;
    .registers 3

    .prologue
    .line 261
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    if-nez v0, :cond_b

    .line 262
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/github/mikephil/charting/formatter/DefaultValueFormatter;-><init>(I)V

    .line 263
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    goto :goto_a
.end method

.method public getValueTextColor()I
    .registers 3

    .prologue
    .line 289
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getValueTextColor(I)I
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 294
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    iget-object v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getValueTextSize()F
    .registers 2

    .prologue
    .line 304
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueTextSize:F

    return v0
.end method

.method public getValueTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 299
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isDrawValuesEnabled()Z
    .registers 2

    .prologue
    .line 314
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mDrawValues:Z

    return v0
.end method

.method public isHighlightEnabled()Z
    .registers 2

    .prologue
    .line 247
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mHighlightEnabled:Z

    return v0
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 324
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-boolean v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mVisible:Z

    return v0
.end method

.method public notifyDataSetChanged()V
    .registers 3

    .prologue
    .line 100
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/BaseDataSet;->calcMinMax(II)V

    .line 101
    return-void
.end method

.method public removeEntry(I)Z
    .registers 4
    .param p1, "xIndex"    # I

    .prologue
    .line 368
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 369
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v1

    return v1
.end method

.method public removeFirst()Z
    .registers 3

    .prologue
    .line 354
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 355
    .local v0, "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v1

    return v1
.end method

.method public removeLast()Z
    .registers 3

    .prologue
    .line 361
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/github/mikephil/charting/data/BaseDataSet;->getEntryForIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v0

    .line 362
    .local v0, "entry":Lcom/github/mikephil/charting/data/Entry;, "TT;"
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v1

    return v1
.end method

.method public resetColors()V
    .registers 2

    .prologue
    .line 225
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 226
    return-void
.end method

.method public setAxisDependency(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)V
    .registers 2
    .param p1, "dependency"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 334
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mAxisDependency:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .line 335
    return-void
.end method

.method public setColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 194
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->resetColors()V

    .line 195
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 196
    return-void
.end method

.method public setColor(II)V
    .registers 6
    .param p1, "color"    # I
    .param p2, "alpha"    # I

    .prologue
    .line 205
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {p2, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/BaseDataSet;->setColor(I)V

    .line 206
    return-void
.end method

.method public setColors(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 139
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 140
    return-void
.end method

.method public setColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 152
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/ColorTemplate;->createColors([I)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 153
    return-void
.end method

.method public setColors([II)V
    .registers 10
    .param p1, "colors"    # [I
    .param p2, "alpha"    # I

    .prologue
    .line 215
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/BaseDataSet;->resetColors()V

    .line 216
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_20

    aget v1, v0, v2

    .line 217
    .local v1, "color":I
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v6

    invoke-static {p2, v4, v5, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/github/mikephil/charting/data/BaseDataSet;->addColor(I)V

    .line 216
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 219
    .end local v1    # "color":I
    :cond_20
    return-void
.end method

.method public setColors([ILandroid/content/Context;)V
    .registers 9
    .param p1, "colors"    # [I
    .param p2, "c"    # Landroid/content/Context;

    .prologue
    .line 167
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 169
    .local v1, "clrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_8
    if-ge v3, v4, :cond_1e

    aget v2, v0, v3

    .line 170
    .local v2, "color":I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    .line 173
    .end local v2    # "color":I
    :cond_1e
    iput-object v1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mColors:Ljava/util/List;

    .line 174
    return-void
.end method

.method public setDrawValues(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 309
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mDrawValues:Z

    .line 310
    return-void
.end method

.method public setHighlightEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 242
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mHighlightEnabled:Z

    .line 243
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .registers 2
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 232
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mLabel:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V
    .registers 2
    .param p1, "f"    # Lcom/github/mikephil/charting/formatter/ValueFormatter;

    .prologue
    .line 253
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    if-nez p1, :cond_3

    .line 257
    :goto_2
    return-void

    .line 256
    :cond_3
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueFormatter:Lcom/github/mikephil/charting/formatter/ValueFormatter;

    goto :goto_2
.end method

.method public setValueTextColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 268
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 269
    iget-object v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    return-void
.end method

.method public setValueTextColors(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 274
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueColors:Ljava/util/List;

    .line 275
    return-void
.end method

.method public setValueTextSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 284
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    invoke-static {p1}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueTextSize:F

    .line 285
    return-void
.end method

.method public setValueTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 279
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mValueTypeface:Landroid/graphics/Typeface;

    .line 280
    return-void
.end method

.method public setVisible(Z)V
    .registers 2
    .param p1, "visible"    # Z

    .prologue
    .line 319
    .local p0, "this":Lcom/github/mikephil/charting/data/BaseDataSet;, "Lcom/github/mikephil/charting/data/BaseDataSet<TT;>;"
    iput-boolean p1, p0, Lcom/github/mikephil/charting/data/BaseDataSet;->mVisible:Z

    .line 320
    return-void
.end method
