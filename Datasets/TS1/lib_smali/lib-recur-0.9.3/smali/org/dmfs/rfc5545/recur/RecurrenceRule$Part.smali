.class public abstract enum Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "Part"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum _BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum _BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

.field public static final enum _SANITY_FILTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;


# instance fields
.field final converter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 12

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$1;

    const-string v1, "FREQ"

    new-instance v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$FreqConverter;

    invoke-direct {v2, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$FreqConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v0, v1, v8, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$1;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$2;

    const-string v1, "INTERVAL"

    new-instance v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const v3, 0x7fffffff

    invoke-direct {v2, v9, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-direct {v0, v1, v9, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$2;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$3;

    const-string v1, "RSCALE"

    new-instance v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RScaleConverter;

    invoke-direct {v2, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RScaleConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v0, v1, v10, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$3;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$4;

    const-string v1, "WKST"

    new-instance v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;

    invoke-direct {v2, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v0, v1, v11, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$4;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$5;

    const-string v1, "BYMONTH"

    const/4 v2, 0x4

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$MonthConverter;

    invoke-direct {v4, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$MonthConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$5;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$6;

    const-string v1, "_BYMONTHSKIP"

    const/4 v2, 0x5

    # getter for: Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->access$500()Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$6;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$7;

    const-string v1, "BYWEEKNO"

    const/4 v2, 0x6

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, -0x35

    const/16 v6, 0x35

    invoke-direct {v4, v5, v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->noZero()Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$7;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$8;

    const-string v1, "BYYEARDAY"

    const/4 v2, 0x7

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, -0x16e

    const/16 v6, 0x16e

    invoke-direct {v4, v5, v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->noZero()Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$8;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$9;

    const-string v1, "BYMONTHDAY"

    const/16 v2, 0x8

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, -0x1f

    const/16 v6, 0x1f

    invoke-direct {v4, v5, v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->noZero()Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$9;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$10;

    const-string v1, "_BYMONTHDAYSKIP"

    const/16 v2, 0x9

    # getter for: Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->access$500()Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$10;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$11;

    const-string v1, "BYDAY"

    const/16 v2, 0xa

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;

    invoke-direct {v4, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$11;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$12;

    const-string v1, "BYHOUR"

    const/16 v2, 0xb

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, 0x17

    invoke-direct {v4, v8, v5}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$12;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$13;

    const-string v1, "BYMINUTE"

    const/16 v2, 0xc

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, 0x3b

    invoke-direct {v4, v8, v5}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$13;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$14;

    const-string v1, "BYSECOND"

    const/16 v2, 0xd

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, 0x3c

    invoke-direct {v4, v8, v5}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$14;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$15;

    const-string v1, "SKIP"

    const/16 v2, 0xe

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$SkipValueConverter;

    invoke-direct {v3, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$SkipValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$15;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$16;

    const-string v1, "_SANITY_FILTER"

    const/16 v2, 0xf

    # getter for: Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->access$500()Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$16;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_SANITY_FILTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$17;

    const-string v1, "BYSETPOS"

    const/16 v2, 0x10

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;

    new-instance v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const/16 v5, -0x1f4

    const/16 v6, 0x1f4

    invoke-direct {v4, v5, v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->noZero()Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$17;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$18;

    const-string v1, "UNTIL"

    const/16 v2, 0x11

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;

    invoke-direct {v3, v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$18;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$19;

    const-string v1, "COUNT"

    const/16 v2, 0x12

    new-instance v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;

    const v4, 0x7fffffff

    invoke-direct {v3, v9, v4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;-><init>(II)V

    invoke-direct {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part$19;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    const/16 v0, 0x13

    new-array v0, v0, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v1, v0, v8

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v1, v0, v9

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v1, v0, v10

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v1, v0, v11

    const/4 v1, 0x4

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_SANITY_FILTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->$VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
            "<*>;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->converter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->$VALUES:[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    return-object v0
.end method


# virtual methods
.method abstract expands(Lorg/dmfs/rfc5545/recur/RecurrenceRule;)Z
.end method

.method abstract getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method abstract getFilter(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Lorg/dmfs/rfc5545/recur/ByFilter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method
