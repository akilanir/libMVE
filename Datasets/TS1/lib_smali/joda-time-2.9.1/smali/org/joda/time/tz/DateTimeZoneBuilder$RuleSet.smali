.class final Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;
.super Ljava/lang/Object;
.source "DateTimeZoneBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/tz/DateTimeZoneBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RuleSet"
.end annotation


# static fields
.field private static final YEAR_LIMIT:I


# instance fields
.field private iInitialNameKey:Ljava/lang/String;

.field private iInitialSaveMillis:I

.field private iRules:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;",
            ">;"
        }
    .end annotation
.end field

.field private iStandardOffset:I

.field private iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

.field private iUpperYear:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 950
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    .line 951
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v2

    invoke-virtual {v2}, Lorg/joda/time/chrono/ISOChronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x64

    sput v0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->YEAR_LIMIT:I

    .line 952
    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    .line 965
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 966
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    .line 967
    const v0, 0x7fffffff

    iput v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    .line 968
    return-void
.end method

.method constructor <init>(Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;)V
    .registers 4

    .prologue
    .line 973
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 974
    iget v0, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    iput v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    .line 975
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    .line 976
    iget-object v0, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialNameKey:Ljava/lang/String;

    iput-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialNameKey:Ljava/lang/String;

    .line 977
    iget v0, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialSaveMillis:I

    iput v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialSaveMillis:I

    .line 978
    iget v0, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    iput v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    .line 979
    iget-object v0, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

    iput-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

    .line 980
    return-void
.end method


# virtual methods
.method public addRule(Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;)V
    .registers 3

    .prologue
    .line 997
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 998
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1000
    :cond_d
    return-void
.end method

.method public buildTailZone(Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;
    .registers 6

    .prologue
    const v3, 0x7fffffff

    .line 1144
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_37

    .line 1145
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;

    .line 1146
    iget-object v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;

    .line 1147
    invoke-virtual {v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->getToYear()I

    move-result v2

    if-ne v2, v3, :cond_37

    invoke-virtual {v1}, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->getToYear()I

    move-result v2

    if-ne v2, v3, :cond_37

    .line 1157
    new-instance v2, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    iget v3, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    iget-object v0, v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->iRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    iget-object v1, v1, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->iRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-direct {v2, p1, v3, v0, v1}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;-><init>(Ljava/lang/String;ILorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;)V

    move-object v0, v2

    .line 1161
    :goto_36
    return-object v0

    :cond_37
    const/4 v0, 0x0

    goto :goto_36
.end method

.method public firstTransition(J)Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;
    .registers 11

    .prologue
    .line 1014
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialNameKey:Ljava/lang/String;

    if-eqz v0, :cond_15

    .line 1016
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    iget-object v3, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialNameKey:Ljava/lang/String;

    iget v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    iget v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialSaveMillis:I

    add-int v4, v1, v2

    iget v5, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    move-wide v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLjava/lang/String;II)V

    .line 1070
    :goto_14
    return-object v0

    .line 1021
    :cond_15
    new-instance v6, Ljava/util/ArrayList;

    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1027
    const-wide/high16 v2, -0x8000000000000000L

    .line 1028
    const/4 v1, 0x0

    .line 1029
    const/4 v0, 0x0

    move-object v7, v0

    move v0, v1

    move-object v1, v7

    .line 1032
    :goto_23
    invoke-virtual {p0, v2, v3, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->nextTransition(JI)Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    move-result-object v4

    if-eqz v4, :cond_7d

    .line 1033
    invoke-virtual {v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getMillis()J

    move-result-wide v2

    .line 1035
    cmp-long v0, v2, p1

    if-nez v0, :cond_39

    .line 1036
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    invoke-direct {v0, p1, p2, v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLorg/joda/time/tz/DateTimeZoneBuilder$Transition;)V

    .line 1069
    :cond_36
    :goto_36
    iput-object v6, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    goto :goto_14

    .line 1040
    :cond_39
    cmp-long v0, v2, p1

    if-lez v0, :cond_6e

    .line 1041
    if-nez v1, :cond_7b

    .line 1045
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_43
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;

    .line 1046
    invoke-virtual {v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->getSaveMillis()I

    move-result v3

    if-nez v3, :cond_43

    .line 1047
    new-instance v1, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    iget v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    invoke-direct {v1, p1, p2, v0, v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLorg/joda/time/tz/DateTimeZoneBuilder$Rule;I)V

    move-object v0, v1

    .line 1052
    :goto_5d
    if-nez v0, :cond_36

    .line 1056
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    invoke-virtual {v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getNameKey()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    iget v5, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    move-wide v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLjava/lang/String;II)V

    goto :goto_36

    .line 1064
    :cond_6e
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    invoke-direct {v0, p1, p2, v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLorg/joda/time/tz/DateTimeZoneBuilder$Transition;)V

    .line 1066
    invoke-virtual {v4}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;->getSaveMillis()I

    move-result v1

    move-object v7, v0

    move v0, v1

    move-object v1, v7

    goto :goto_23

    :cond_7b
    move-object v0, v1

    goto :goto_5d

    :cond_7d
    move-object v0, v1

    goto :goto_36
.end method

.method public getStandardOffset()I
    .registers 2

    .prologue
    .line 984
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    return v0
.end method

.method public getUpperLimit(I)J
    .registers 5

    .prologue
    .line 1134
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_d

    .line 1135
    const-wide v0, 0x7fffffffffffffffL

    .line 1137
    :goto_c
    return-wide v0

    :cond_d
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

    iget v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    iget v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    invoke-virtual {v0, v1, v2, p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;->setInstant(III)J

    move-result-wide v0

    goto :goto_c
.end method

.method public nextTransition(JI)Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;
    .registers 16

    .prologue
    const/4 v6, 0x0

    .line 1085
    invoke-static {}, Lorg/joda/time/chrono/ISOChronology;->getInstanceUTC()Lorg/joda/time/chrono/ISOChronology;

    move-result-object v7

    .line 1089
    const-wide v3, 0x7fffffffffffffffL

    .line 1091
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iRules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move-object v5, v6

    .line 1092
    :goto_11
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 1093
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;

    .line 1094
    iget v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    invoke-virtual {v0, p1, p2, v1, p3}, Lorg/joda/time/tz/DateTimeZoneBuilder$Rule;->next(JII)J

    move-result-wide v1

    .line 1095
    cmp-long v9, v1, p1

    if-gtz v9, :cond_2b

    .line 1096
    invoke-interface {v8}, Ljava/util/Iterator;->remove()V

    goto :goto_11

    .line 1101
    :cond_2b
    cmp-long v9, v1, v3

    if-gtz v9, :cond_61

    move-wide v10, v1

    move-object v2, v0

    move-wide v0, v10

    :goto_32
    move-wide v3, v0

    move-object v5, v2

    .line 1106
    goto :goto_11

    .line 1108
    :cond_35
    if-nez v5, :cond_38

    .line 1127
    :cond_37
    :goto_37
    return-object v6

    .line 1113
    :cond_38
    invoke-virtual {v7}, Lorg/joda/time/Chronology;->year()Lorg/joda/time/DateTimeField;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Lorg/joda/time/DateTimeField;->get(J)I

    move-result v0

    sget v1, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->YEAR_LIMIT:I

    if-ge v0, v1, :cond_37

    .line 1118
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    const v1, 0x7fffffff

    if-ge v0, v1, :cond_59

    .line 1119
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

    iget v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    iget v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    invoke-virtual {v0, v1, v2, p3}, Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;->setInstant(III)J

    move-result-wide v0

    .line 1121
    cmp-long v0, v3, v0

    if-gez v0, :cond_37

    .line 1127
    :cond_59
    new-instance v6, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;

    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    invoke-direct {v6, v3, v4, v5, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Transition;-><init>(JLorg/joda/time/tz/DateTimeZoneBuilder$Rule;I)V

    goto :goto_37

    :cond_61
    move-wide v0, v3

    move-object v2, v5

    goto :goto_32
.end method

.method public setFixedSavings(Ljava/lang/String;I)V
    .registers 3

    .prologue
    .line 992
    iput-object p1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialNameKey:Ljava/lang/String;

    .line 993
    iput p2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iInitialSaveMillis:I

    .line 994
    return-void
.end method

.method public setStandardOffset(I)V
    .registers 2

    .prologue
    .line 988
    iput p1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iStandardOffset:I

    .line 989
    return-void
.end method

.method public setUpperLimit(ILorg/joda/time/tz/DateTimeZoneBuilder$OfYear;)V
    .registers 3

    .prologue
    .line 1003
    iput p1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperYear:I

    .line 1004
    iput-object p2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$RuleSet;->iUpperOfYear:Lorg/joda/time/tz/DateTimeZoneBuilder$OfYear;

    .line 1005
    return-void
.end method
