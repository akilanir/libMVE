.class abstract Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;
.super Ljava/lang/Object;
.source "PeriodFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/PeriodFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "IgnorableAffix"
.end annotation


# instance fields
.field private volatile iOtherAffixes:[Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 969
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public finish(Ljava/util/Set;)V
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 973
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;->iOtherAffixes:[Ljava/lang/String;

    if-nez v0, :cond_6a

    .line 975
    const v2, 0x7fffffff

    .line 976
    const/4 v1, 0x0

    .line 977
    invoke-virtual {p0}, Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;->getAffixes()[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    move v4, v3

    :goto_f
    if-ge v4, v6, :cond_23

    aget-object v0, v5, v4

    .line 978
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v7, v2, :cond_6b

    .line 979
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 977
    :goto_1d
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    move v2, v1

    move-object v1, v0

    goto :goto_f

    .line 987
    :cond_23
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 988
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;

    .line 989
    if-eqz v0, :cond_2c

    .line 990
    invoke-interface {v0}, Lorg/joda/time/format/PeriodFormatterBuilder$PeriodFieldAffix;->getAffixes()[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    move v0, v3

    :goto_40
    if-ge v0, v7, :cond_2c

    aget-object v8, v6, v0

    .line 991
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-gt v9, v2, :cond_56

    invoke-virtual {v8, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_59

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_59

    .line 993
    :cond_56
    invoke-interface {v4, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 990
    :cond_59
    add-int/lit8 v0, v0, 0x1

    goto :goto_40

    .line 998
    :cond_5c
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;->iOtherAffixes:[Ljava/lang/String;

    .line 1000
    :cond_6a
    return-void

    :cond_6b
    move-object v0, v1

    move v1, v2

    goto :goto_1d
.end method

.method protected matchesOtherAffix(ILjava/lang/String;I)Z
    .registers 13

    .prologue
    .line 1013
    iget-object v0, p0, Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;->iOtherAffixes:[Ljava/lang/String;

    if-eqz v0, :cond_2f

    .line 1016
    iget-object v7, p0, Lorg/joda/time/format/PeriodFormatterBuilder$IgnorableAffix;->iOtherAffixes:[Ljava/lang/String;

    array-length v8, v7

    const/4 v0, 0x0

    move v6, v0

    :goto_9
    if-ge v6, v8, :cond_2f

    aget-object v3, v7, v6

    .line 1017
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    .line 1018
    if-ge p1, v5, :cond_1d

    const/4 v1, 0x1

    const/4 v4, 0x0

    move-object v0, p2

    move v2, p3

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_29

    :cond_1d
    if-ne p1, v5, :cond_2b

    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v0, p2

    move v2, p3

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 1020
    :cond_29
    const/4 v0, 0x1

    .line 1024
    :goto_2a
    return v0

    .line 1016
    :cond_2b
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_9

    .line 1024
    :cond_2f
    const/4 v0, 0x0

    goto :goto_2a
.end method
