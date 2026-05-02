.class public Ljunit/framework/ComparisonCompactor;
.super Ljava/lang/Object;
.source "ComparisonCompactor.java"


# static fields
.field private static final DELTA_END:Ljava/lang/String; = "]"

.field private static final DELTA_START:Ljava/lang/String; = "["

.field private static final ELLIPSIS:Ljava/lang/String; = "..."


# instance fields
.field private fActual:Ljava/lang/String;

.field private fContextLength:I

.field private fExpected:Ljava/lang/String;

.field private fPrefix:I

.field private fSuffix:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "contextLength"    # I
    .param p2, "expected"    # Ljava/lang/String;
    .param p3, "actual"    # Ljava/lang/String;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Ljunit/framework/ComparisonCompactor;->fContextLength:I

    .line 17
    iput-object p2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    .line 19
    return-void
.end method

.method private areStringsEqual()Z
    .registers 3

    .prologue
    .line 75
    iget-object v0, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private compactString(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "result":Ljava/lang/String;
    iget v1, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    if-lez v1, :cond_41

    .line 36
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Ljunit/framework/ComparisonCompactor;->computeCommonPrefix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    :cond_41
    iget v1, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    if-lez v1, :cond_5a

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Ljunit/framework/ComparisonCompactor;->computeCommonSuffix()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 41
    :cond_5a
    return-object v0
.end method

.method private computeCommonPrefix()Ljava/lang/String;
    .registers 6

    .prologue
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fContextLength:I

    if-le v0, v2, :cond_2c

    const-string v0, "..."

    :goto_d
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    const/4 v2, 0x0

    iget v3, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    iget v4, p0, Ljunit/framework/ComparisonCompactor;->fContextLength:I

    sub-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_2c
    const-string v0, ""

    goto :goto_d
.end method

.method private computeCommonSuffix()Ljava/lang/String;
    .registers 6

    .prologue
    .line 70
    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fContextLength:I

    add-int/2addr v1, v2

    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 71
    .local v0, "end":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    iget-object v3, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iget v3, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    sub-int/2addr v1, v3

    add-int/lit8 v1, v1, 0x1

    iget-object v3, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget v4, p0, Ljunit/framework/ComparisonCompactor;->fContextLength:I

    sub-int/2addr v3, v4

    if-ge v1, v3, :cond_53

    const-string v1, "..."

    :goto_4a
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_53
    const-string v1, ""

    goto :goto_4a
.end method

.method private findCommonPrefix()V
    .registers 5

    .prologue
    .line 45
    const/4 v1, 0x0

    iput v1, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    .line 46
    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 47
    .local v0, "end":I
    :goto_13
    iget v1, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    if-ge v1, v0, :cond_29

    .line 48
    iget-object v1, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    iget v3, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v1, v2, :cond_2a

    .line 52
    :cond_29
    return-void

    .line 47
    :cond_2a
    iget v1, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    goto :goto_13
.end method

.method private findCommonSuffix()V
    .registers 5

    .prologue
    .line 55
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 56
    .local v1, "expectedSuffix":I
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .line 57
    .local v0, "actualSuffix":I
    :goto_10
    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    if-lt v0, v2, :cond_26

    iget v2, p0, Ljunit/framework/ComparisonCompactor;->fPrefix:I

    if-lt v1, v2, :cond_26

    .line 58
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iget-object v3, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_30

    .line 62
    :cond_26
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    iput v2, p0, Ljunit/framework/ComparisonCompactor;->fSuffix:I

    .line 63
    return-void

    .line 57
    :cond_30
    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_10
.end method


# virtual methods
.method public compact(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 22
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    if-eqz v2, :cond_e

    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    if-eqz v2, :cond_e

    invoke-direct {p0}, Ljunit/framework/ComparisonCompactor;->areStringsEqual()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 23
    :cond_e
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    iget-object v3, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-static {p1, v2, v3}, Ljunit/framework/Assert;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 30
    :goto_16
    return-object v2

    .line 26
    :cond_17
    invoke-direct {p0}, Ljunit/framework/ComparisonCompactor;->findCommonPrefix()V

    .line 27
    invoke-direct {p0}, Ljunit/framework/ComparisonCompactor;->findCommonSuffix()V

    .line 28
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fExpected:Ljava/lang/String;

    invoke-direct {p0, v2}, Ljunit/framework/ComparisonCompactor;->compactString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "expected":Ljava/lang/String;
    iget-object v2, p0, Ljunit/framework/ComparisonCompactor;->fActual:Ljava/lang/String;

    invoke-direct {p0, v2}, Ljunit/framework/ComparisonCompactor;->compactString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, "actual":Ljava/lang/String;
    invoke-static {p1, v1, v0}, Ljunit/framework/Assert;->format(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_16
.end method
