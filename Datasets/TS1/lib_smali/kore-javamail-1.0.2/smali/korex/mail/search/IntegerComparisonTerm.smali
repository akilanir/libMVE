.class public abstract Lkorex/mail/search/IntegerComparisonTerm;
.super Lkorex/mail/search/ComparisonTerm;
.source "IntegerComparisonTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x60a39325f9860814L


# instance fields
.field protected number:I


# direct methods
.method protected constructor <init>(II)V
    .registers 3
    .param p1, "comparison"    # I
    .param p2, "number"    # I

    .prologue
    .line 59
    invoke-direct {p0}, Lkorex/mail/search/ComparisonTerm;-><init>()V

    .line 60
    iput p1, p0, Lkorex/mail/search/IntegerComparisonTerm;->comparison:I

    .line 61
    iput p2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    .line 62
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 105
    instance-of v2, p1, Lkorex/mail/search/IntegerComparisonTerm;

    if-nez v2, :cond_6

    .line 108
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 107
    check-cast v0, Lkorex/mail/search/IntegerComparisonTerm;

    .line 108
    .local v0, "ict":Lkorex/mail/search/IntegerComparisonTerm;
    iget v2, v0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    iget v3, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-ne v2, v3, :cond_5

    invoke-super {p0, p1}, Lkorex/mail/search/ComparisonTerm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getComparison()I
    .registers 2

    .prologue
    .line 79
    iget v0, p0, Lkorex/mail/search/IntegerComparisonTerm;->comparison:I

    return v0
.end method

.method public getNumber()I
    .registers 2

    .prologue
    .line 70
    iget v0, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    return v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 115
    iget v0, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    invoke-super {p0}, Lkorex/mail/search/ComparisonTerm;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected match(I)Z
    .registers 5
    .param p1, "i"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 83
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->comparison:I

    packed-switch v2, :pswitch_data_2e

    move v0, v1

    .line 97
    :cond_8
    :goto_8
    return v0

    .line 85
    :pswitch_9
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-le p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 87
    :pswitch_f
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-lt p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 89
    :pswitch_15
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-eq p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 91
    :pswitch_1b
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-ne p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 93
    :pswitch_21
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-gt p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 95
    :pswitch_27
    iget v2, p0, Lkorex/mail/search/IntegerComparisonTerm;->number:I

    if-ge p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    .line 83
    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_9
        :pswitch_f
        :pswitch_15
        :pswitch_1b
        :pswitch_21
        :pswitch_27
    .end packed-switch
.end method
