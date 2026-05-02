.class synthetic Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$dmfs$rfc5545$recur$Freq:[I

.field static final synthetic $SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

.field static final synthetic $SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->values()[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    :try_start_9
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_d5

    :goto_14
    :try_start_14
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_d2

    :goto_1f
    :try_start_1f
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_cf

    :goto_2a
    :try_start_2a
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_cc

    :goto_35
    :try_start_35
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_c9

    :goto_40
    :try_start_40
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_c7

    :goto_4b
    :try_start_4b
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_c5

    :goto_56
    :try_start_56
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_62} :catch_c3

    :goto_62
    invoke-static {}, Lorg/dmfs/rfc5545/recur/Freq;->values()[Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$Freq:[I

    :try_start_6b
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$Freq:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/Freq;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_76
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6b .. :try_end_76} :catch_c1

    :goto_76
    :try_start_76
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$Freq:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/Freq;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_81
    .catch Ljava/lang/NoSuchFieldError; {:try_start_76 .. :try_end_81} :catch_bf

    :goto_81
    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->values()[Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    :try_start_8a
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_95
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8a .. :try_end_95} :catch_bd

    :goto_95
    :try_start_95
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_a0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_95 .. :try_end_a0} :catch_bb

    :goto_a0
    :try_start_a0
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_ab
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a0 .. :try_end_ab} :catch_b9

    :goto_ab
    :try_start_ab
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_b6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_ab .. :try_end_b6} :catch_b7

    :goto_b6
    return-void

    :catch_b7
    move-exception v0

    goto :goto_b6

    :catch_b9
    move-exception v0

    goto :goto_ab

    :catch_bb
    move-exception v0

    goto :goto_a0

    :catch_bd
    move-exception v0

    goto :goto_95

    :catch_bf
    move-exception v0

    goto :goto_81

    :catch_c1
    move-exception v0

    goto :goto_76

    :catch_c3
    move-exception v0

    goto :goto_62

    :catch_c5
    move-exception v0

    goto :goto_56

    :catch_c7
    move-exception v0

    goto :goto_4b

    :catch_c9
    move-exception v0

    goto/16 :goto_40

    :catch_cc
    move-exception v0

    goto/16 :goto_35

    :catch_cf
    move-exception v0

    goto/16 :goto_2a

    :catch_d2
    move-exception v0

    goto/16 :goto_1f

    :catch_d5
    move-exception v0

    goto/16 :goto_14
.end method
