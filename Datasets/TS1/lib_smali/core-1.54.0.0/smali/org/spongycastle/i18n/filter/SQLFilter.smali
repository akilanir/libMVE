.class public Lorg/spongycastle/i18n/filter/SQLFilter;
.super Ljava/lang/Object;
.source "SQLFilter.java"

# interfaces
.implements Lorg/spongycastle/i18n/filter/Filter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFilter(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 14
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 15
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 16
    .local v2, "i":I
    :goto_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-ge v2, v3, :cond_70

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v1

    .line 19
    .local v1, "ch":C
    sparse-switch v1, :sswitch_data_76

    .line 59
    :goto_13
    add-int/lit8 v2, v2, 0x1

    .line 60
    goto :goto_6

    .line 22
    :sswitch_16
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\\'"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    goto :goto_13

    .line 26
    :sswitch_20
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\\""

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 27
    add-int/lit8 v2, v2, 0x1

    .line 28
    goto :goto_13

    .line 30
    :sswitch_2a
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\="

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    goto :goto_13

    .line 34
    :sswitch_34
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\-"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    goto :goto_13

    .line 38
    :sswitch_3e
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\/"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    goto :goto_13

    .line 42
    :sswitch_48
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\\\"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    goto :goto_13

    .line 46
    :sswitch_52
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\;"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 47
    add-int/lit8 v2, v2, 0x1

    .line 48
    goto :goto_13

    .line 50
    :sswitch_5c
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\r"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    add-int/lit8 v2, v2, 0x1

    .line 52
    goto :goto_13

    .line 54
    :sswitch_66
    add-int/lit8 v3, v2, 0x1

    const-string v4, "\\n"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    add-int/lit8 v2, v2, 0x1

    .line 56
    goto :goto_13

    .line 61
    .end local v1    # "ch":C
    :cond_70
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 19
    nop

    :sswitch_data_76
    .sparse-switch
        0xa -> :sswitch_66
        0xd -> :sswitch_5c
        0x22 -> :sswitch_20
        0x27 -> :sswitch_16
        0x2d -> :sswitch_34
        0x2f -> :sswitch_3e
        0x3b -> :sswitch_52
        0x3d -> :sswitch_2a
        0x5c -> :sswitch_48
    .end sparse-switch
.end method

.method public doFilterUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lorg/spongycastle/i18n/filter/SQLFilter;->doFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
