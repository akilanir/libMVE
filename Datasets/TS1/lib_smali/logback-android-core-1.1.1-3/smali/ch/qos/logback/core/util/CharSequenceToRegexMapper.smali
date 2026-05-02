.class Lch/qos/logback/core/util/CharSequenceToRegexMapper;
.super Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private number(I)Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\\d{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method toRegex(Lch/qos/logback/core/util/CharSequenceState;)Ljava/lang/String;
    .registers 6

    const/4 v3, 0x1

    iget v0, p1, Lch/qos/logback/core/util/CharSequenceState;->occurrences:I

    iget-char v1, p1, Lch/qos/logback/core/util/CharSequenceState;->c:C

    iget-char v2, p1, Lch/qos/logback/core/util/CharSequenceState;->c:C

    sparse-switch v2, :sswitch_data_72

    if-ne v0, v3, :cond_54

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1f
    return-object v0

    :sswitch_20
    const-string v0, ".*"

    goto :goto_1f

    :sswitch_23
    const/4 v1, 0x3

    if-lt v0, v1, :cond_29

    const-string v0, ".{3,12}"

    goto :goto_1f

    :cond_29
    invoke-direct {p0, v0}, Lch/qos/logback/core/util/CharSequenceToRegexMapper;->number(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    :sswitch_2e
    invoke-direct {p0, v0}, Lch/qos/logback/core/util/CharSequenceToRegexMapper;->number(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    :sswitch_33
    const-string v0, ".{2,12}"

    goto :goto_1f

    :sswitch_36
    const-string v0, ".{2}"

    goto :goto_1f

    :sswitch_39
    const-string v0, "(\\+|-)\\d{4}"

    goto :goto_1f

    :sswitch_3c
    const-string v0, "\\."

    goto :goto_1f

    :sswitch_3f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Forward slashes are not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_47
    if-ne v0, v3, :cond_4c

    const-string v0, ""

    goto :goto_1f

    :cond_4c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Too many single quotes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_54
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1f

    :sswitch_data_72
    .sparse-switch
        0x27 -> :sswitch_47
        0x2e -> :sswitch_3c
        0x44 -> :sswitch_2e
        0x45 -> :sswitch_33
        0x46 -> :sswitch_2e
        0x47 -> :sswitch_20
        0x48 -> :sswitch_2e
        0x4b -> :sswitch_2e
        0x4d -> :sswitch_23
        0x53 -> :sswitch_2e
        0x57 -> :sswitch_2e
        0x5a -> :sswitch_39
        0x5c -> :sswitch_3f
        0x61 -> :sswitch_36
        0x64 -> :sswitch_2e
        0x68 -> :sswitch_2e
        0x6b -> :sswitch_2e
        0x6d -> :sswitch_2e
        0x73 -> :sswitch_2e
        0x77 -> :sswitch_2e
        0x79 -> :sswitch_2e
        0x7a -> :sswitch_20
    .end sparse-switch
.end method
