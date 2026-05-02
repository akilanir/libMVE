.class Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;
.super Ljava/lang/Object;
.source "DateTimeFormatterBuilder.java"

# interfaces
.implements Lorg/joda/time/format/InternalPrinter;
.implements Lorg/joda/time/format/InternalParser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/format/DateTimeFormatterBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Fraction"
.end annotation


# instance fields
.field private final iFieldType:Lorg/joda/time/DateTimeFieldType;

.field protected iMaxDigits:I

.field protected iMinDigits:I


# direct methods
.method protected constructor <init>(Lorg/joda/time/DateTimeFieldType;II)V
    .registers 5

    .prologue
    const/16 v0, 0x12

    .line 1783
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1784
    iput-object p1, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iFieldType:Lorg/joda/time/DateTimeFieldType;

    .line 1786
    if-le p3, v0, :cond_a

    move p3, v0

    .line 1789
    :cond_a
    iput p2, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMinDigits:I

    .line 1790
    iput p3, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMaxDigits:I

    .line 1791
    return-void
.end method

.method private getFractionData(JLorg/joda/time/DateTimeField;)[J
    .registers 11

    .prologue
    .line 1871
    invoke-virtual {p3}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v3

    .line 1873
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMaxDigits:I

    move v2, v0

    .line 1875
    :goto_b
    packed-switch v2, :pswitch_data_7e

    .line 1876
    const-wide/16 v0, 0x1

    .line 1896
    :goto_10
    mul-long v5, v3, v0

    div-long/2addr v5, v0

    cmp-long v5, v5, v3

    if-nez v5, :cond_7a

    .line 1903
    const/4 v5, 0x2

    new-array v5, v5, [J

    const/4 v6, 0x0

    mul-long/2addr v0, p1

    div-long/2addr v0, v3

    aput-wide v0, v5, v6

    const/4 v0, 0x1

    int-to-long v1, v2

    aput-wide v1, v5, v0

    return-object v5

    .line 1877
    :pswitch_24
    const-wide/16 v0, 0xa

    goto :goto_10

    .line 1878
    :pswitch_27
    const-wide/16 v0, 0x64

    goto :goto_10

    .line 1879
    :pswitch_2a
    const-wide/16 v0, 0x3e8

    goto :goto_10

    .line 1880
    :pswitch_2d
    const-wide/16 v0, 0x2710

    goto :goto_10

    .line 1881
    :pswitch_30
    const-wide/32 v0, 0x186a0

    goto :goto_10

    .line 1882
    :pswitch_34
    const-wide/32 v0, 0xf4240

    goto :goto_10

    .line 1883
    :pswitch_38
    const-wide/32 v0, 0x989680

    goto :goto_10

    .line 1884
    :pswitch_3c
    const-wide/32 v0, 0x5f5e100

    goto :goto_10

    .line 1885
    :pswitch_40
    const-wide/32 v0, 0x3b9aca00

    goto :goto_10

    .line 1886
    :pswitch_44
    const-wide v0, 0x2540be400L

    goto :goto_10

    .line 1887
    :pswitch_4a
    const-wide v0, 0x174876e800L

    goto :goto_10

    .line 1888
    :pswitch_50
    const-wide v0, 0xe8d4a51000L

    goto :goto_10

    .line 1889
    :pswitch_56
    const-wide v0, 0x9184e72a000L

    goto :goto_10

    .line 1890
    :pswitch_5c
    const-wide v0, 0x5af3107a4000L

    goto :goto_10

    .line 1891
    :pswitch_62
    const-wide v0, 0x38d7ea4c68000L

    goto :goto_10

    .line 1892
    :pswitch_68
    const-wide v0, 0x2386f26fc10000L

    goto :goto_10

    .line 1893
    :pswitch_6e
    const-wide v0, 0x16345785d8a0000L

    goto :goto_10

    .line 1894
    :pswitch_74
    const-wide v0, 0xde0b6b3a7640000L

    goto :goto_10

    .line 1900
    :cond_7a
    add-int/lit8 v0, v2, -0x1

    move v2, v0

    goto :goto_b

    .line 1875
    :pswitch_data_7e
    .packed-switch 0x1
        :pswitch_24
        :pswitch_27
        :pswitch_2a
        :pswitch_2d
        :pswitch_30
        :pswitch_34
        :pswitch_38
        :pswitch_3c
        :pswitch_40
        :pswitch_44
        :pswitch_4a
        :pswitch_50
        :pswitch_56
        :pswitch_5c
        :pswitch_62
        :pswitch_68
        :pswitch_6e
        :pswitch_74
    .end packed-switch
.end method


# virtual methods
.method public estimateParsedLength()I
    .registers 2

    .prologue
    .line 1907
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMaxDigits:I

    return v0
.end method

.method public estimatePrintedLength()I
    .registers 2

    .prologue
    .line 1794
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMaxDigits:I

    return v0
.end method

.method public parseInto(Lorg/joda/time/format/DateTimeParserBucket;Ljava/lang/CharSequence;I)I
    .registers 15

    .prologue
    const-wide/16 v9, 0xa

    .line 1911
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iFieldType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {p1}, Lorg/joda/time/format/DateTimeParserBucket;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v5

    .line 1913
    iget v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMaxDigits:I

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1915
    const-wide/16 v3, 0x0

    .line 1916
    invoke-virtual {v5}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/DurationField;->getUnitMillis()J

    move-result-wide v0

    mul-long v1, v0, v9

    .line 1917
    const/4 v0, 0x0

    .line 1918
    :goto_24
    if-ge v0, v6, :cond_34

    .line 1919
    add-int v7, p3, v0

    invoke-interface {p2, v7}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v7

    .line 1920
    const/16 v8, 0x30

    if-lt v7, v8, :cond_34

    const/16 v8, 0x39

    if-le v7, v8, :cond_3b

    .line 1929
    :cond_34
    div-long v1, v3, v9

    .line 1931
    if-nez v0, :cond_44

    .line 1932
    xor-int/lit8 v0, p3, -0x1

    .line 1946
    :goto_3a
    return v0

    .line 1923
    :cond_3b
    add-int/lit8 v0, v0, 0x1

    .line 1924
    div-long/2addr v1, v9

    .line 1925
    add-int/lit8 v7, v7, -0x30

    int-to-long v7, v7

    mul-long/2addr v7, v1

    add-long/2addr v3, v7

    .line 1927
    goto :goto_24

    .line 1935
    :cond_44
    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-lez v3, :cond_4e

    .line 1936
    xor-int/lit8 v0, p3, -0x1

    goto :goto_3a

    .line 1939
    :cond_4e
    new-instance v3, Lorg/joda/time/field/PreciseDateTimeField;

    invoke-static {}, Lorg/joda/time/DateTimeFieldType;->millisOfSecond()Lorg/joda/time/DateTimeFieldType;

    move-result-object v4

    sget-object v6, Lorg/joda/time/field/MillisDurationField;->INSTANCE:Lorg/joda/time/DurationField;

    invoke-virtual {v5}, Lorg/joda/time/DateTimeField;->getDurationField()Lorg/joda/time/DurationField;

    move-result-object v5

    invoke-direct {v3, v4, v6, v5}, Lorg/joda/time/field/PreciseDateTimeField;-><init>(Lorg/joda/time/DateTimeFieldType;Lorg/joda/time/DurationField;Lorg/joda/time/DurationField;)V

    .line 1944
    long-to-int v1, v1

    invoke-virtual {p1, v3, v1}, Lorg/joda/time/format/DateTimeParserBucket;->saveField(Lorg/joda/time/DateTimeField;I)V

    .line 1946
    add-int/2addr v0, p3

    goto :goto_3a
.end method

.method protected printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v1, 0x0

    const/16 v9, 0x30

    .line 1813
    iget-object v0, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iFieldType:Lorg/joda/time/DateTimeFieldType;

    invoke-virtual {v0, p4}, Lorg/joda/time/DateTimeFieldType;->getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DateTimeField;

    move-result-object v0

    .line 1814
    iget v4, p0, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->iMinDigits:I

    .line 1818
    :try_start_c
    invoke-virtual {v0, p2, p3}, Lorg/joda/time/DateTimeField;->remainder(J)J
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_f} :catch_1e

    move-result-wide v2

    .line 1824
    const-wide/16 v5, 0x0

    cmp-long v5, v2, v5

    if-nez v5, :cond_23

    .line 1825
    :goto_16
    add-int/lit8 v4, v4, -0x1

    if-ltz v4, :cond_22

    .line 1826
    invoke-interface {p1, v9}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_16

    .line 1819
    :catch_1e
    move-exception v0

    .line 1820
    invoke-static {p1, v4}, Lorg/joda/time/format/DateTimeFormatterBuilder;->appendUnknownString(Ljava/lang/Appendable;I)V

    .line 1868
    :cond_22
    :goto_22
    return-void

    .line 1832
    :cond_23
    invoke-direct {p0, v2, v3, v0}, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->getFractionData(JLorg/joda/time/DateTimeField;)[J

    move-result-object v0

    .line 1833
    aget-wide v5, v0, v1

    .line 1834
    aget-wide v2, v0, v10

    long-to-int v2, v2

    .line 1836
    const-wide/32 v7, 0x7fffffff

    and-long/2addr v7, v5

    cmp-long v0, v7, v5

    if-nez v0, :cond_47

    .line 1837
    long-to-int v0, v5

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 1842
    :goto_39
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1844
    :goto_3d
    if-ge v3, v2, :cond_4c

    .line 1845
    invoke-interface {p1, v9}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1846
    add-int/lit8 v4, v4, -0x1

    .line 1847
    add-int/lit8 v2, v2, -0x1

    goto :goto_3d

    .line 1839
    :cond_47
    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    goto :goto_39

    .line 1850
    :cond_4c
    if-ge v4, v2, :cond_71

    .line 1852
    :goto_4e
    if-ge v4, v2, :cond_5a

    .line 1853
    if-le v3, v10, :cond_5a

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v9, :cond_6c

    .line 1859
    :cond_5a
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v3, v2, :cond_71

    .line 1860
    :goto_60
    if-ge v1, v3, :cond_22

    .line 1861
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-interface {p1, v2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 1860
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 1856
    :cond_6c
    add-int/lit8 v2, v2, -0x1

    .line 1857
    add-int/lit8 v3, v3, -0x1

    goto :goto_4e

    .line 1867
    :cond_71
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_22
.end method

.method public printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;ILorg/joda/time/DateTimeZone;Ljava/util/Locale;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1800
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V

    .line 1801
    return-void
.end method

.method public printTo(Ljava/lang/Appendable;Lorg/joda/time/ReadablePartial;Ljava/util/Locale;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1806
    invoke-interface {p2}, Lorg/joda/time/ReadablePartial;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p2, v1, v2}, Lorg/joda/time/Chronology;->set(Lorg/joda/time/ReadablePartial;J)J

    move-result-wide v0

    .line 1807
    invoke-interface {p2}, Lorg/joda/time/ReadablePartial;->getChronology()Lorg/joda/time/Chronology;

    move-result-object v2

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/joda/time/format/DateTimeFormatterBuilder$Fraction;->printTo(Ljava/lang/Appendable;JLorg/joda/time/Chronology;)V

    .line 1808
    return-void
.end method
