.class public abstract Lcom/github/mikephil/charting/data/ChartData;
.super Ljava/lang/Object;
.source "ChartData.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/github/mikephil/charting/interfaces/datasets/IDataSet",
        "<+",
        "Lcom/github/mikephil/charting/data/Entry;",
        ">;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected mDataSets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected mLeftAxisMax:F

.field protected mLeftAxisMin:F

.field protected mRightAxisMax:F

.field protected mRightAxisMin:F

.field private mXValMaximumLength:F

.field protected mXVals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mYMax:F

.field protected mYMin:F

.field private mYValCount:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 32
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 34
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 36
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 38
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 40
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 32
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 34
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 36
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 38
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 40
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 75
    iput-object p1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    .line 77
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->init()V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p2, "sets":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 32
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 34
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 36
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 38
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 40
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 101
    iput-object p1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 102
    iput-object p2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    .line 104
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->init()V

    .line 105
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 4
    .param p1, "xVals"    # [Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 32
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 34
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 36
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 38
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 40
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 87
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/ChartData;->arrayToList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    .line 89
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->init()V

    .line 90
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p1, "xVals"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p2, "sets":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v1, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 32
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 34
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 36
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 38
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 40
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 45
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 51
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 116
    invoke-direct {p0, p1}, Lcom/github/mikephil/charting/data/ChartData;->arrayToList([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 117
    iput-object p2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    .line 119
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->init()V

    .line 120
    return-void
.end method

.method private arrayToList([Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "array"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private calcXValMaximumLength()V
    .registers 5

    .prologue
    .line 150
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-gtz v3, :cond_d

    .line 151
    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 166
    :goto_c
    return-void

    .line 155
    :cond_d
    const/4 v2, 0x1

    .line 157
    .local v2, "max":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_f
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_29

    .line 159
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 161
    .local v1, "length":I
    if-le v1, v2, :cond_26

    .line 162
    move v2, v1

    .line 157
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 165
    .end local v1    # "length":I
    :cond_29
    int-to-float v3, v2

    iput v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    goto :goto_c
.end method

.method private checkLegal()V
    .registers 4

    .prologue
    .line 174
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-nez v1, :cond_5

    .line 186
    :cond_4
    return-void

    .line 177
    :cond_5
    instance-of v1, p0, Lcom/github/mikephil/charting/data/ScatterData;

    if-nez v1, :cond_4

    instance-of v1, p0, Lcom/github/mikephil/charting/data/CombinedData;

    if-nez v1, :cond_4

    .line 180
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 181
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v1

    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v1, v2, :cond_32

    .line 182
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "One or more of the DataSet Entry arrays are longer than the x-values array of this ChartData object."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 180
    :cond_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_e
.end method

.method public static generateXVals(II)Ljava/util/List;
    .registers 6
    .param p0, "from"    # I
    .param p1, "to"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 844
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 846
    .local v1, "xvals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move v0, p0

    .local v0, "i":I
    :goto_6
    if-ge v0, p1, :cond_21

    .line 847
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 846
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 850
    :cond_21
    return-object v1
.end method

.method private handleEmptyAxis(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .prologue
    .line 577
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "firstLeft":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    .local p2, "firstRight":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    if-nez p1, :cond_b

    .line 578
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 579
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 584
    :cond_a
    :goto_a
    return-void

    .line 580
    :cond_b
    if-nez p2, :cond_a

    .line 581
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 582
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto :goto_a
.end method


# virtual methods
.method public addDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 524
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "d":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    if-nez p1, :cond_3

    .line 566
    :goto_2
    return-void

    .line 527
    :cond_3
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 529
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_52

    .line 531
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 532
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 534
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v0, v1, :cond_45

    .line 536
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 537
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 563
    :cond_34
    :goto_34
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 565
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstLeft()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v0

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstRight()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/github/mikephil/charting/data/ChartData;->handleEmptyAxis(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    goto :goto_2

    .line 539
    :cond_45
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 540
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto :goto_34

    .line 544
    :cond_52
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_62

    .line 545
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 546
    :cond_62
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_72

    .line 547
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 549
    :cond_72
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v0

    sget-object v1, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v0, v1, :cond_9b

    .line 551
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_8a

    .line 552
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 553
    :cond_8a
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_34

    .line 554
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    goto :goto_34

    .line 556
    :cond_9b
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_ab

    .line 557
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 558
    :cond_ab
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_34

    .line 559
    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto/16 :goto_34
.end method

.method public addEntry(Lcom/github/mikephil/charting/data/Entry;I)V
    .registers 7
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "dataSetIndex"    # I

    .prologue
    .line 636
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, p2, :cond_b2

    if-ltz p2, :cond_b2

    .line 638
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 640
    .local v0, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v0, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->addEntry(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v2

    if-nez v2, :cond_19

    .line 685
    .end local v0    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :goto_18
    return-void

    .line 643
    .restart local v0    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_19
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    .line 645
    .local v1, "val":F
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    if-nez v2, :cond_58

    .line 646
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 647
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 649
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v2, v3, :cond_4b

    .line 651
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 652
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 678
    :cond_39
    :goto_39
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 680
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstLeft()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstRight()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/github/mikephil/charting/data/ChartData;->handleEmptyAxis(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    goto :goto_18

    .line 654
    :cond_4b
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 655
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto :goto_39

    .line 659
    :cond_58
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    cmpg-float v2, v2, v1

    if-gez v2, :cond_60

    .line 660
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 661
    :cond_60
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    cmpl-float v2, v2, v1

    if-lez v2, :cond_68

    .line 662
    iput v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 664
    :cond_68
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v2, v3, :cond_91

    .line 666
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_80

    .line 667
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 668
    :cond_80
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_39

    .line 669
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    goto :goto_39

    .line 671
    :cond_91
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gez v2, :cond_a1

    .line 672
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 673
    :cond_a1
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    cmpl-float v2, v2, v3

    if-lez v2, :cond_39

    .line 674
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v2

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto :goto_39

    .line 683
    .end local v0    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .end local v1    # "val":F
    :cond_b2
    const-string v2, "addEntry"

    const-string v3, "Cannot add Entry because dataSetIndex too high or too low."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_18
.end method

.method public addXValue(Ljava/lang/String;)V
    .registers 4
    .param p1, "xVal"    # Ljava/lang/String;

    .prologue
    .line 394
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_14

    .line 395
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    .line 397
    :cond_14
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 398
    return-void
.end method

.method public calcMinMax(II)V
    .registers 13
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const v9, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v8, 0x0

    .line 202
    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-eqz v6, :cond_11

    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-ge v6, v7, :cond_16

    .line 204
    :cond_11
    iput v8, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 205
    iput v8, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 269
    :goto_15
    return-void

    .line 208
    :cond_16
    iput v9, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 209
    const v6, -0x800001

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 211
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1e
    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_54

    .line 213
    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 214
    .local v5, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v5, p1, p2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->calcMinMax(II)V

    .line 216
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_41

    .line 217
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 219
    :cond_41
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_51

    .line 220
    invoke-interface {v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 211
    :cond_51
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 223
    .end local v5    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_54
    iget v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    cmpl-float v6, v6, v9

    if-nez v6, :cond_5e

    .line 224
    iput v8, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    .line 225
    iput v8, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    .line 229
    :cond_5e
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstLeft()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v1

    .line 231
    .local v1, "firstLeft":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    if-eqz v1, :cond_ab

    .line 233
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 234
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 236
    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_76
    :goto_76
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ab

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 237
    .local v0, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v6, v7, :cond_76

    .line 238
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_9a

    .line 239
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 241
    :cond_9a
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_76

    .line 242
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    goto :goto_76

    .line 248
    .end local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_ab
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->getFirstRight()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    move-result-object v2

    .line 250
    .local v2, "firstRight":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    if-eqz v2, :cond_f8

    .line 252
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    .line 253
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 255
    iget-object v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_c3
    :goto_c3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 256
    .restart local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v6

    sget-object v7, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v6, v7, :cond_c3

    .line 257
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    cmpg-float v6, v6, v7

    if-gez v6, :cond_e7

    .line 258
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMin()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    .line 260
    :cond_e7
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iget v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_c3

    .line 261
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getYMax()F

    move-result v6

    iput v6, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    goto :goto_c3

    .line 267
    .end local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_f8
    invoke-direct {p0, v1, v2}, Lcom/github/mikephil/charting/data/ChartData;->handleEmptyAxis(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    goto/16 :goto_15
.end method

.method protected calcYValueCount()V
    .registers 4

    .prologue
    .line 279
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v2, 0x0

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 281
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-nez v2, :cond_8

    .line 291
    :goto_7
    return-void

    .line 284
    :cond_8
    const/4 v0, 0x0

    .line 286
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_22

    .line 287
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v2

    add-int/2addr v0, v2

    .line 286
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 290
    :cond_22
    iput v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    goto :goto_7
.end method

.method public clearValues()V
    .registers 2

    .prologue
    .line 958
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 959
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->notifyDataChanged()V

    .line 960
    return-void
.end method

.method public contains(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 989
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 990
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 991
    const/4 v2, 0x1

    .line 994
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public getColors()[I
    .registers 9

    .prologue
    .line 772
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-nez v7, :cond_6

    .line 773
    const/4 v4, 0x0

    .line 794
    :cond_5
    return-object v4

    .line 775
    :cond_6
    const/4 v1, 0x0

    .line 777
    .local v1, "clrcnt":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_8
    iget-object v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v5, v7, :cond_24

    .line 778
    iget-object v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getColors()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v1, v7

    .line 777
    add-int/lit8 v5, v5, 0x1

    goto :goto_8

    .line 781
    :cond_24
    new-array v4, v1, [I

    .line 782
    .local v4, "colors":[I
    const/4 v3, 0x0

    .line 784
    .local v3, "cnt":I
    const/4 v5, 0x0

    :goto_28
    iget-object v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v5, v7, :cond_5

    .line 786
    iget-object v7, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v7}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getColors()Ljava/util/List;

    move-result-object v2

    .line 788
    .local v2, "clrs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_40
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_55

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 789
    .local v0, "clr":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aput v7, v4, v3

    .line 790
    add-int/lit8 v3, v3, 0x1

    .line 791
    goto :goto_40

    .line 784
    .end local v0    # "clr":Ljava/lang/Integer;
    :cond_55
    add-int/lit8 v5, v5, 0x1

    goto :goto_28
.end method

.method public getDataSetByIndex(I)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .registers 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 511
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-eqz v0, :cond_e

    if-ltz p1, :cond_e

    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_10

    .line 512
    :cond_e
    const/4 v0, 0x0

    .line 514
    :goto_f
    return-object v0

    :cond_10
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    goto :goto_f
.end method

.method public getDataSetByLabel(Ljava/lang/String;Z)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .registers 5
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "ignorecase"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)TT;"
        }
    .end annotation

    .prologue
    .line 501
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-virtual {p0, v1, p1, p2}, Lcom/github/mikephil/charting/data/ChartData;->getDataSetIndexByLabel(Ljava/util/List;Ljava/lang/String;Z)I

    move-result v0

    .line 503
    .local v0, "index":I
    if-ltz v0, :cond_10

    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_12

    .line 504
    :cond_10
    const/4 v1, 0x0

    .line 506
    :goto_11
    return-object v1

    :cond_12
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    goto :goto_11
.end method

.method public getDataSetCount()I
    .registers 2

    .prologue
    .line 301
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    if-nez v0, :cond_6

    .line 302
    const/4 v0, 0x0

    .line 303
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getDataSetForEntry(Lcom/github/mikephil/charting/data/Entry;)Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .registers 7
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/github/mikephil/charting/data/Entry;",
            ")TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v3, 0x0

    .line 748
    if-nez p1, :cond_5

    move-object v2, v3

    .line 761
    :cond_4
    :goto_4
    return-object v2

    .line 751
    :cond_5
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v4, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_31

    .line 753
    iget-object v4, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 755
    .local v2, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_17
    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v4

    if-ge v1, v4, :cond_2e

    .line 756
    invoke-virtual {p1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v4

    invoke-interface {v2, v4}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/github/mikephil/charting/data/Entry;->equalTo(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 755
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 751
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .end local v1    # "j":I
    .end local v2    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    :cond_31
    move-object v2, v3

    .line 761
    goto :goto_4
.end method

.method protected getDataSetIndexByLabel(Ljava/util/List;Ljava/lang/String;Z)I
    .registers 6
    .param p2, "label"    # Ljava/lang/String;
    .param p3, "ignorecase"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;",
            "Ljava/lang/String;",
            "Z)I"
        }
    .end annotation

    .prologue
    .line 427
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "dataSets":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-eqz p3, :cond_1e

    .line 428
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3a

    .line 429
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1b

    move v1, v0

    .line 437
    :goto_1a
    return v1

    .line 428
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 432
    .end local v0    # "i":I
    :cond_1e
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_3a

    .line 433
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getLabel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    move v1, v0

    .line 434
    goto :goto_1a

    .line 432
    :cond_37
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 437
    :cond_3a
    const/4 v1, -0x1

    goto :goto_1a
.end method

.method protected getDataSetLabels()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 457
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 459
    .local v1, "types":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_22

    .line 460
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-interface {v2}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getLabel()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 459
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 463
    :cond_22
    return-object v1
.end method

.method public getDataSets()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 410
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    return-object v0
.end method

.method public getEntryForHighlight(Lcom/github/mikephil/charting/highlight/Highlight;)Lcom/github/mikephil/charting/data/Entry;
    .registers 8
    .param p1, "highlight"    # Lcom/github/mikephil/charting/highlight/Highlight;

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v4, 0x0

    .line 473
    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v3

    iget-object v5, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-lt v3, v5, :cond_f

    move-object v1, v4

    .line 486
    :goto_e
    return-object v1

    .line 479
    :cond_f
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getDataSetIndex()I

    move-result v5

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getXIndex()I

    move-result v5

    invoke-interface {v3, v5}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntriesForXIndex(I)Ljava/util/List;

    move-result-object v0

    .line 481
    .local v0, "entries":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .local v1, "entry":Ljava/lang/Object;
    move-object v3, v1

    .line 482
    check-cast v3, Lcom/github/mikephil/charting/data/Entry;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v3

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getValue()F

    move-result v5

    cmpl-float v3, v3, v5

    if-eqz v3, :cond_4a

    invoke-virtual {p1}, Lcom/github/mikephil/charting/highlight/Highlight;->getValue()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 484
    :cond_4a
    check-cast v1, Lcom/github/mikephil/charting/data/Entry;

    goto :goto_e

    .end local v1    # "entry":Ljava/lang/Object;
    :cond_4d
    move-object v1, v4

    .line 486
    goto :goto_e
.end method

.method public getFirstLeft()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 813
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 814
    .local v0, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v2, v3, :cond_6

    .line 818
    .end local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    :goto_1a
    return-object v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public getFirstRight()Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 828
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 829
    .local v0, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    invoke-interface {v0}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getAxisDependency()Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    move-result-object v2

    sget-object v3, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->RIGHT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne v2, v3, :cond_6

    .line 833
    .end local v0    # "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    :goto_1a
    return-object v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public getIndexOfDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 798
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_15

    .line 799
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_12

    .line 803
    .end local v0    # "i":I
    :goto_11
    return v0

    .line 798
    .restart local v0    # "i":I
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 803
    :cond_15
    const/4 v0, -0x1

    goto :goto_11
.end method

.method public getXValCount()I
    .registers 2

    .prologue
    .line 447
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getXValMaximumLength()F
    .registers 2

    .prologue
    .line 357
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXValMaximumLength:F

    return v0
.end method

.method public getXVals()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 376
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    return-object v0
.end method

.method public getYMax()F
    .registers 2

    .prologue
    .line 334
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMax:F

    return v0
.end method

.method public getYMax(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F
    .registers 3
    .param p1, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 344
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne p1, v0, :cond_7

    .line 345
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMax:F

    .line 347
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMax:F

    goto :goto_6
.end method

.method public getYMin()F
    .registers 2

    .prologue
    .line 312
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYMin:F

    return v0
.end method

.method public getYMin(Lcom/github/mikephil/charting/components/YAxis$AxisDependency;)F
    .registers 3
    .param p1, "axis"    # Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    .prologue
    .line 322
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    sget-object v0, Lcom/github/mikephil/charting/components/YAxis$AxisDependency;->LEFT:Lcom/github/mikephil/charting/components/YAxis$AxisDependency;

    if-ne p1, v0, :cond_7

    .line 323
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mLeftAxisMin:F

    .line 325
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mRightAxisMin:F

    goto :goto_6
.end method

.method public getYValCount()I
    .registers 2

    .prologue
    .line 367
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    return v0
.end method

.method protected init()V
    .registers 3

    .prologue
    .line 138
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/ChartData;->checkLegal()V

    .line 139
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->calcYValueCount()V

    .line 140
    const/4 v0, 0x0

    iget v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    invoke-virtual {p0, v0, v1}, Lcom/github/mikephil/charting/data/ChartData;->calcMinMax(II)V

    .line 142
    invoke-direct {p0}, Lcom/github/mikephil/charting/data/ChartData;->calcXValMaximumLength()V

    .line 143
    return-void
.end method

.method public isHighlightEnabled()Z
    .registers 4

    .prologue
    .line 946
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 947
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->isHighlightEnabled()Z

    move-result v2

    if-nez v2, :cond_6

    .line 948
    const/4 v2, 0x0

    .line 950
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x1

    goto :goto_19
.end method

.method public notifyDataChanged()V
    .registers 1

    .prologue
    .line 194
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/ChartData;->init()V

    .line 195
    return-void
.end method

.method public removeDataSet(I)Z
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 620
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_a

    if-gez p1, :cond_c

    .line 621
    :cond_a
    const/4 v1, 0x0

    .line 624
    :goto_b
    return v1

    .line 623
    :cond_c
    iget-object v1, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 624
    .local v0, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    invoke-virtual {p0, v0}, Lcom/github/mikephil/charting/data/ChartData;->removeDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)Z

    move-result v1

    goto :goto_b
.end method

.method public removeDataSet(Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "d":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;, "TT;"
    const/4 v1, 0x0

    .line 595
    if-nez p1, :cond_5

    move v0, v1

    .line 608
    :cond_4
    :goto_4
    return v0

    .line 598
    :cond_5
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 601
    .local v0, "removed":Z
    if-eqz v0, :cond_4

    .line 603
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    invoke-interface {p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryCount()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 605
    iget v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    invoke-virtual {p0, v1, v2}, Lcom/github/mikephil/charting/data/ChartData;->calcMinMax(II)V

    goto :goto_4
.end method

.method public removeEntry(II)Z
    .registers 7
    .param p1, "xIndex"    # I
    .param p2, "dataSetIndex"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v2, 0x0

    .line 727
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p2, v3, :cond_a

    .line 736
    :cond_9
    :goto_9
    return v2

    .line 730
    :cond_a
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 731
    .local v0, "dataSet":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v0, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->getEntryForXIndex(I)Lcom/github/mikephil/charting/data/Entry;

    move-result-object v1

    .line 733
    .local v1, "e":Lcom/github/mikephil/charting/data/Entry;
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Lcom/github/mikephil/charting/data/Entry;->getXIndex()I

    move-result v3

    if-ne v3, p1, :cond_9

    .line 736
    invoke-virtual {p0, v1, p2}, Lcom/github/mikephil/charting/data/ChartData;->removeEntry(Lcom/github/mikephil/charting/data/Entry;I)Z

    move-result v2

    goto :goto_9
.end method

.method public removeEntry(Lcom/github/mikephil/charting/data/Entry;I)Z
    .registers 7
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;
    .param p2, "dataSetIndex"    # I

    .prologue
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    const/4 v2, 0x0

    .line 696
    if-eqz p1, :cond_b

    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p2, v3, :cond_d

    :cond_b
    move v0, v2

    .line 713
    :cond_c
    :goto_c
    return v0

    .line 699
    :cond_d
    iget-object v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 701
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    if-eqz v1, :cond_29

    .line 703
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->removeEntry(Lcom/github/mikephil/charting/data/Entry;)Z

    move-result v0

    .line 705
    .local v0, "removed":Z
    if-eqz v0, :cond_c

    .line 706
    iget v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    .line 708
    iget v3, p0, Lcom/github/mikephil/charting/data/ChartData;->mYValCount:I

    invoke-virtual {p0, v2, v3}, Lcom/github/mikephil/charting/data/ChartData;->calcMinMax(II)V

    goto :goto_c

    .end local v0    # "removed":Z
    :cond_29
    move v0, v2

    .line 713
    goto :goto_c
.end method

.method public removeXValue(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 406
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v0, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 407
    return-void
.end method

.method public setDrawValues(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 923
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 924
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setDrawValues(Z)V

    goto :goto_6

    .line 926
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setHighlightEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 934
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 935
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setHighlightEnabled(Z)V

    goto :goto_6

    .line 937
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V
    .registers 5
    .param p1, "f"    # Lcom/github/mikephil/charting/formatter/ValueFormatter;

    .prologue
    .line 859
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    if-nez p1, :cond_3

    .line 866
    :cond_2
    return-void

    .line 862
    :cond_3
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 863
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V

    goto :goto_9
.end method

.method public setValueTextColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 875
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 876
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueTextColor(I)V

    goto :goto_6

    .line 878
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setValueTextColors(Ljava/util/List;)V
    .registers 5
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
    .line 887
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "colors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 888
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueTextColors(Ljava/util/List;)V

    goto :goto_6

    .line 890
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setValueTextSize(F)V
    .registers 5
    .param p1, "size"    # F

    .prologue
    .line 911
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 912
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueTextSize(F)V

    goto :goto_6

    .line 914
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setValueTypeface(Landroid/graphics/Typeface;)V
    .registers 5
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 899
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    iget-object v2, p0, Lcom/github/mikephil/charting/data/ChartData;->mDataSets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 900
    .local v1, "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    invoke-interface {v1, p1}, Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;->setValueTypeface(Landroid/graphics/Typeface;)V

    goto :goto_6

    .line 902
    .end local v1    # "set":Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;
    :cond_16
    return-void
.end method

.method public setXVals(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 384
    .local p0, "this":Lcom/github/mikephil/charting/data/ChartData;, "Lcom/github/mikephil/charting/data/ChartData<TT;>;"
    .local p1, "xVals":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/data/ChartData;->mXVals:Ljava/util/List;

    .line 385
    return-void
.end method
