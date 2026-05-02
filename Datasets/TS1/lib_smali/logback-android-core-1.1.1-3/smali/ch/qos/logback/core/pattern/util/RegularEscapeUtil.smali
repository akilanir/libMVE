.class public Lch/qos/logback/core/pattern/util/RegularEscapeUtil;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/pattern/util/IEscapeUtil;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static basicEscape(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v0, 0x0

    :goto_a
    if-ge v0, v2, :cond_3b

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v4, 0x5c

    if-ne v0, v4, :cond_40

    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v4, 0x6e

    if-ne v1, v4, :cond_26

    const/16 v1, 0xa

    :cond_22
    :goto_22
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_a

    :cond_26
    const/16 v4, 0x72

    if-ne v1, v4, :cond_2d

    const/16 v1, 0xd

    goto :goto_22

    :cond_2d
    const/16 v4, 0x74

    if-ne v1, v4, :cond_34

    const/16 v1, 0x9

    goto :goto_22

    :cond_34
    const/16 v4, 0x66

    if-ne v1, v4, :cond_22

    const/16 v1, 0xc

    goto :goto_22

    :cond_3b
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_40
    move v5, v1

    move v1, v0

    move v0, v5

    goto :goto_22
.end method


# virtual methods
.method public escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V
    .registers 9

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_a

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_9
    :sswitch_9
    return-void

    :cond_a
    sparse-switch p3, :sswitch_data_5a

    invoke-virtual {p0, p1}, Lch/qos/logback/core/pattern/util/RegularEscapeUtil;->formatEscapeCharsForListing(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Illegal char \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Only \\\\, \\_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", \\t, \\n, \\r combinations are allowed as escape characters."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :sswitch_44
    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_9

    :sswitch_48
    const/16 v0, 0x9

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_9

    :sswitch_4e
    const/16 v0, 0xd

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_9

    :sswitch_54
    const/16 v0, 0xa

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_9

    :sswitch_data_5a
    .sparse-switch
        0x5c -> :sswitch_44
        0x5f -> :sswitch_9
        0x6e -> :sswitch_54
        0x72 -> :sswitch_4e
        0x74 -> :sswitch_48
    .end sparse-switch
.end method

.method formatEscapeCharsForListing(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v0, 0x0

    :goto_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1c

    const-string v2, ", \\"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_1c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
