.class public Lcom/github/mikephil/charting/utils/SelectionDetail;
.super Ljava/lang/Object;
.source "SelectionDetail.java"


# instance fields
.field public dataIndex:I

.field public dataSet:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

.field public dataSetIndex:I

.field public value:F

.field public y:F


# direct methods
.method public constructor <init>(FFIILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V
    .registers 6
    .param p1, "y"    # F
    .param p2, "value"    # F
    .param p3, "dataIndex"    # I
    .param p4, "dataSetIndex"    # I
    .param p5, "set"    # Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput p1, p0, Lcom/github/mikephil/charting/utils/SelectionDetail;->y:F

    .line 23
    iput p2, p0, Lcom/github/mikephil/charting/utils/SelectionDetail;->value:F

    .line 24
    iput p3, p0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataIndex:I

    .line 25
    iput p4, p0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSetIndex:I

    .line 26
    iput-object p5, p0, Lcom/github/mikephil/charting/utils/SelectionDetail;->dataSet:Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .line 27
    return-void
.end method

.method public constructor <init>(FFILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V
    .registers 11
    .param p1, "y"    # F
    .param p2, "value"    # F
    .param p3, "dataSetIndex"    # I
    .param p4, "set"    # Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .prologue
    .line 30
    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FFIILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 31
    return-void
.end method

.method public constructor <init>(FILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V
    .registers 10
    .param p1, "value"    # F
    .param p2, "dataSetIndex"    # I
    .param p3, "set"    # Lcom/github/mikephil/charting/interfaces/datasets/IDataSet;

    .prologue
    .line 34
    const/high16 v1, 0x7fc00000    # Float.NaN

    const/4 v3, 0x0

    move-object v0, p0

    move v2, p1

    move v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/github/mikephil/charting/utils/SelectionDetail;-><init>(FFIILcom/github/mikephil/charting/interfaces/datasets/IDataSet;)V

    .line 35
    return-void
.end method
