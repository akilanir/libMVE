.class public Lcom/github/mikephil/charting/components/XAxis;
.super Lcom/github/mikephil/charting/components/AxisBase;
.source "XAxis.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;
    }
.end annotation


# instance fields
.field private mAvoidFirstLastClipping:Z

.field public mAxisLabelModulus:I

.field private mIsAxisModulusCustom:Z

.field public mLabelHeight:I

.field public mLabelRotatedHeight:I

.field public mLabelRotatedWidth:I

.field protected mLabelRotationAngle:F

.field public mLabelWidth:I

.field private mPosition:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

.field private mSpaceBetweenLabels:I

.field protected mValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mXAxisValueFormatter:Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 90
    invoke-direct {p0}, Lcom/github/mikephil/charting/components/AxisBase;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mValues:Ljava/util/List;

    .line 27
    iput v1, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelWidth:I

    .line 33
    iput v1, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelHeight:I

    .line 39
    iput v1, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedWidth:I

    .line 45
    iput v1, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotatedHeight:I

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotationAngle:F

    .line 56
    const/4 v0, 0x4

    iput v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mSpaceBetweenLabels:I

    .line 63
    iput v1, p0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 69
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/XAxis;->mIsAxisModulusCustom:Z

    .line 74
    iput-boolean v2, p0, Lcom/github/mikephil/charting/components/XAxis;->mAvoidFirstLastClipping:Z

    .line 79
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultXAxisValueFormatter;

    invoke-direct {v0}, Lcom/github/mikephil/charting/formatter/DefaultXAxisValueFormatter;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mXAxisValueFormatter:Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    .line 82
    sget-object v0, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->TOP:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    iput-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mPosition:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    .line 92
    const/high16 v0, 0x40800000    # 4.0f

    invoke-static {v0}, Lcom/github/mikephil/charting/utils/Utils;->convertDpToPixel(F)F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mYOffset:F

    .line 93
    return-void
.end method


# virtual methods
.method public getLabelRotationAngle()F
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotationAngle:F

    return v0
.end method

.method public getLongestLabel()Ljava/lang/String;
    .registers 6

    .prologue
    .line 246
    const-string v1, ""

    .line 248
    .local v1, "longest":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v3, p0, Lcom/github/mikephil/charting/components/XAxis;->mValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_21

    .line 249
    iget-object v3, p0, Lcom/github/mikephil/charting/components/XAxis;->mValues:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 251
    .local v2, "text":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_1e

    .line 252
    move-object v1, v2

    .line 248
    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 255
    .end local v2    # "text":Ljava/lang/String;
    :cond_21
    return-object v1
.end method

.method public getPosition()Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mPosition:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    return-object v0
.end method

.method public getSpaceBetweenLabels()I
    .registers 2

    .prologue
    .line 180
    iget v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mSpaceBetweenLabels:I

    return v0
.end method

.method public getValueFormatter()Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mXAxisValueFormatter:Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    return-object v0
.end method

.method public getValues()Ljava/util/List;
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
    .line 217
    iget-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mValues:Ljava/util/List;

    return-object v0
.end method

.method public isAvoidFirstLastClippingEnabled()Z
    .registers 2

    .prologue
    .line 199
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mAvoidFirstLastClipping:Z

    return v0
.end method

.method public isAxisModulusCustom()Z
    .registers 2

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mIsAxisModulusCustom:Z

    return v0
.end method

.method public resetLabelsToSkip()V
    .registers 2

    .prologue
    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mIsAxisModulusCustom:Z

    .line 163
    return-void
.end method

.method public setAvoidFirstLastClipping(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 190
    iput-boolean p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mAvoidFirstLastClipping:Z

    .line 191
    return-void
.end method

.method public setLabelRotationAngle(F)V
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 124
    iput p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mLabelRotationAngle:F

    .line 125
    return-void
.end method

.method public setLabelsToSkip(I)V
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 149
    if-gez p1, :cond_3

    .line 150
    const/4 p1, 0x0

    .line 152
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mIsAxisModulusCustom:Z

    .line 153
    add-int/lit8 v0, p1, 0x1

    iput v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mAxisLabelModulus:I

    .line 154
    return-void
.end method

.method public setPosition(Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;)V
    .registers 2
    .param p1, "pos"    # Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mPosition:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    .line 109
    return-void
.end method

.method public setSpaceBetweenLabels(I)V
    .registers 2
    .param p1, "spaceCharacters"    # I

    .prologue
    .line 135
    iput p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mSpaceBetweenLabels:I

    .line 136
    return-void
.end method

.method public setValueFormatter(Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;)V
    .registers 3
    .param p1, "formatter"    # Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    .prologue
    .line 229
    if-nez p1, :cond_a

    .line 230
    new-instance v0, Lcom/github/mikephil/charting/formatter/DefaultXAxisValueFormatter;

    invoke-direct {v0}, Lcom/github/mikephil/charting/formatter/DefaultXAxisValueFormatter;-><init>()V

    iput-object v0, p0, Lcom/github/mikephil/charting/components/XAxis;->mXAxisValueFormatter:Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    .line 233
    :goto_9
    return-void

    .line 232
    :cond_a
    iput-object p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mXAxisValueFormatter:Lcom/github/mikephil/charting/formatter/XAxisValueFormatter;

    goto :goto_9
.end method

.method public setValues(Ljava/util/List;)V
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
    .line 208
    .local p1, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/github/mikephil/charting/components/XAxis;->mValues:Ljava/util/List;

    .line 209
    return-void
.end method
