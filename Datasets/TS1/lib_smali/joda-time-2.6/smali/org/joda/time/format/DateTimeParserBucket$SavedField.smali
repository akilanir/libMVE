.class Lorg/joda/time/format/DateTimeParserBucket$SavedField;
.super Ljava/lang/Object;
.source "DateTimeParserBucket.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeParserBucket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SavedField"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/joda/time/format/DateTimeParserBucket$SavedField;",
        ">;"
    }
.end annotation


# instance fields
.field iField:Lorg/joda/time/DateTimeField;

.field iLocale:Ljava/util/Locale;

.field iText:Ljava/lang/String;

.field iValue:I


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 549
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 550
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 543
    check-cast p1, Lorg/joda/time/format/DateTimeParserBucket$SavedField;

    invoke-virtual {p0, p1}, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->compareTo(Lorg/joda/time/format/DateTimeParserBucket$SavedField;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/joda/time/format/DateTimeParserBucket$SavedField;)I
    .registers 5

    .prologue
    .line 584
    iget-object v1, p1, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    .line 585
    iget-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getRangeDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v1}, Lorg/joda/time/DateTimeField;->getRangeDurationField()Lorg/joda/time/DurationField;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/joda/time/format/DateTimeParserBucket;->compareReverse(Lorg/joda/time/DurationField;Lorg/joda/time/DurationField;)I

    move-result v0

    .line 587
    if-eqz v0, :cond_13

    .line 590
    :goto_12
    return v0

    :cond_13
    iget-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v0}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v1}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/joda/time/format/DateTimeParserBucket;->compareReverse(Lorg/joda/time/DurationField;Lorg/joda/time/DurationField;)I

    move-result v0

    goto :goto_12
.end method

.method init(Lorg/joda/time/DateTimeField;I)V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 553
    iput-object p1, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    .line 554
    iput p2, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iValue:I

    .line 555
    iput-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iText:Ljava/lang/String;

    .line 556
    iput-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iLocale:Ljava/util/Locale;

    .line 557
    return-void
.end method

.method init(Lorg/joda/time/DateTimeField;Ljava/lang/String;Ljava/util/Locale;)V
    .registers 5

    .prologue
    .line 560
    iput-object p1, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    .line 561
    const/4 v0, 0x0

    iput v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iValue:I

    .line 562
    iput-object p2, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iText:Ljava/lang/String;

    .line 563
    iput-object p3, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iLocale:Ljava/util/Locale;

    .line 564
    return-void
.end method

.method set(JZ)J
    .registers 7

    .prologue
    .line 567
    iget-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iText:Ljava/lang/String;

    if-nez v0, :cond_15

    .line 568
    iget-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    iget v1, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iValue:I

    invoke-virtual {v0, p1, p2, v1}, Lorg/joda/time/DateTimeField;->set(JI)J

    move-result-wide v0

    .line 572
    :goto_c
    if-eqz p3, :cond_14

    .line 573
    iget-object v2, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->roundFloor(J)J

    move-result-wide v0

    .line 575
    :cond_14
    return-wide v0

    .line 570
    :cond_15
    iget-object v0, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iField:Lorg/joda/time/DateTimeField;

    iget-object v1, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iText:Ljava/lang/String;

    iget-object v2, p0, Lorg/joda/time/format/DateTimeParserBucket$SavedField;->iLocale:Ljava/util/Locale;

    invoke-virtual {v0, p1, p2, v1, v2}, Lorg/joda/time/DateTimeField;->set(JLjava/lang/String;Ljava/util/Locale;)J

    move-result-wide v0

    goto :goto_c
.end method
