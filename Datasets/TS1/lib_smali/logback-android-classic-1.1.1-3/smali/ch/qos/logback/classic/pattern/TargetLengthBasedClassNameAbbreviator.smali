.class public Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/classic/pattern/Abbreviator;


# instance fields
.field final targetLength:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->targetLength:I

    return-void
.end method

.method static computeDotIndexes(Ljava/lang/String;[I)I
    .registers 5

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    const/16 v2, 0x2e

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_16

    const/16 v2, 0x10

    if-ge v1, v2, :cond_16

    aput v0, p1, v1

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_16
    return v1
.end method

.method static printArray(Ljava/lang/String;[I)V
    .registers 6

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    const/4 v0, 0x0

    :goto_6
    array-length v1, p1

    if-ge v0, v1, :cond_30

    if-nez v0, :cond_15

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    aget v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(I)V

    :goto_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_15
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_12

    :cond_30
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    return-void
.end method


# virtual methods
.method public abbreviate(Ljava/lang/String;)Ljava/lang/String;
    .registers 11

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    iget v0, p0, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->targetLength:I

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    if-nez p1, :cond_12

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Class name may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget v3, p0, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->targetLength:I

    if-ge v0, v3, :cond_1b

    :cond_1a
    :goto_1a
    return-object p1

    :cond_1b
    const/16 v0, 0x10

    new-array v3, v0, [I

    const/16 v0, 0x11

    new-array v4, v0, [I

    invoke-static {p1, v3}, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->computeDotIndexes(Ljava/lang/String;[I)I

    move-result v5

    if-eqz v5, :cond_1a

    invoke-virtual {p0, p1, v3, v4, v5}, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->computeLengthArray(Ljava/lang/String;[I[II)V

    move v0, v1

    :goto_2d
    if-gt v0, v5, :cond_52

    if-nez v0, :cond_3f

    aget v6, v4, v0

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p1, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_3c
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    :cond_3f
    add-int/lit8 v6, v0, -0x1

    aget v6, v3, v6

    add-int/lit8 v7, v0, -0x1

    aget v7, v3, v7

    aget v8, v4, v0

    add-int/2addr v7, v8

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3c

    :cond_52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1a
.end method

.method computeLengthArray(Ljava/lang/String;[I[II)V
    .registers 10

    const/4 v2, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget v1, p0, Lch/qos/logback/classic/pattern/TargetLengthBasedClassNameAbbreviator;->targetLength:I

    sub-int v1, v0, v1

    const/4 v0, 0x0

    move v3, v0

    move v4, v1

    :goto_c
    if-ge v3, p4, :cond_32

    const/4 v0, -0x1

    if-lez v3, :cond_15

    add-int/lit8 v0, v3, -0x1

    aget v0, p2, v0

    :cond_15
    aget v1, p2, v3

    sub-int v0, v1, v0

    add-int/lit8 v1, v0, -0x1

    if-ge v1, v2, :cond_1d

    :cond_1d
    if-lez v4, :cond_30

    if-ge v1, v2, :cond_2e

    move v0, v1

    :goto_22
    sub-int/2addr v1, v0

    sub-int v1, v4, v1

    add-int/lit8 v0, v0, 0x1

    aput v0, p3, v3

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v4, v1

    goto :goto_c

    :cond_2e
    move v0, v2

    goto :goto_22

    :cond_30
    move v0, v1

    goto :goto_22

    :cond_32
    add-int/lit8 v0, p4, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    aget v0, p2, v0

    sub-int v0, v1, v0

    aput v0, p3, p4

    return-void
.end method
