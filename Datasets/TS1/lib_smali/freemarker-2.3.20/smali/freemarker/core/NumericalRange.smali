.class Lfreemarker/core/NumericalRange;
.super Ljava/lang/Object;
.source "NumericalRange.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Ljava/io/Serializable;


# instance fields
.field private descending:Z

.field private lower:I

.field private norhs:Z

.field private upper:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "lower"    # I

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/NumericalRange;->norhs:Z

    .line 77
    iput p1, p0, Lfreemarker/core/NumericalRange;->lower:I

    .line 78
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "left"    # I
    .param p2, "right"    # I

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lfreemarker/core/NumericalRange;->lower:I

    .line 82
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lfreemarker/core/NumericalRange;->upper:I

    .line 83
    iget v0, p0, Lfreemarker/core/NumericalRange;->lower:I

    if-eq p1, v0, :cond_17

    const/4 v0, 0x1

    :goto_14
    iput-boolean v0, p0, Lfreemarker/core/NumericalRange;->descending:Z

    .line 84
    return-void

    .line 83
    :cond_17
    const/4 v0, 0x0

    goto :goto_14
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 87
    iget-boolean v1, p0, Lfreemarker/core/NumericalRange;->descending:Z

    if-eqz v1, :cond_2f

    iget v1, p0, Lfreemarker/core/NumericalRange;->upper:I

    sub-int v0, v1, p1

    .line 88
    .local v0, "index":I
    :goto_8
    iget-boolean v1, p0, Lfreemarker/core/NumericalRange;->norhs:Z

    if-eqz v1, :cond_10

    iget v1, p0, Lfreemarker/core/NumericalRange;->upper:I

    if-gt v0, v1, :cond_14

    :cond_10
    iget v1, p0, Lfreemarker/core/NumericalRange;->lower:I

    if-ge v0, v1, :cond_34

    .line 89
    :cond_14
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Range item index "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, " is out of bounds."

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v1

    .line 87
    .end local v0    # "index":I
    :cond_2f
    iget v1, p0, Lfreemarker/core/NumericalRange;->lower:I

    add-int v0, v1, p1

    goto :goto_8

    .line 92
    .restart local v0    # "index":I
    :cond_34
    new-instance v1, Lfreemarker/template/SimpleNumber;

    invoke-direct {v1, v0}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    return-object v1
.end method

.method hasRhs()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lfreemarker/core/NumericalRange;->norhs:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public size()I
    .registers 3

    .prologue
    .line 96
    iget v0, p0, Lfreemarker/core/NumericalRange;->upper:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lfreemarker/core/NumericalRange;->lower:I

    sub-int/2addr v0, v1

    return v0
.end method
