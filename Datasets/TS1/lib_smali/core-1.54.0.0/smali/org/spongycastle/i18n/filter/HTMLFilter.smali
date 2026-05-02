.class public Lorg/spongycastle/i18n/filter/HTMLFilter;
.super Ljava/lang/Object;
.source "HTMLFilter.java"

# interfaces
.implements Lorg/spongycastle/i18n/filter/Filter;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doFilter(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 12
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 13
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .line 14
    .local v2, "i":I
    :goto_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-ge v2, v3, :cond_78

    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v1

    .line 17
    .local v1, "ch":C
    packed-switch v1, :pswitch_data_7e

    .line 56
    :pswitch_13
    add-int/lit8 v2, v2, -0x3

    .line 58
    :goto_15
    add-int/lit8 v2, v2, 0x4

    .line 59
    goto :goto_6

    .line 20
    :pswitch_18
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#60"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 23
    :pswitch_20
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#62"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 26
    :pswitch_28
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#40"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 29
    :pswitch_30
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#41"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 32
    :pswitch_38
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#35"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 35
    :pswitch_40
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#38"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 38
    :pswitch_48
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#34"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 41
    :pswitch_50
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#39"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 44
    :pswitch_58
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#37"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 47
    :pswitch_60
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#59"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 50
    :pswitch_68
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#43"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 53
    :pswitch_70
    add-int/lit8 v3, v2, 0x1

    const-string v4, "&#45"

    invoke-virtual {v0, v2, v3, v4}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_15

    .line 60
    .end local v1    # "ch":C
    :cond_78
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 17
    nop

    :pswitch_data_7e
    .packed-switch 0x22
        :pswitch_48
        :pswitch_38
        :pswitch_13
        :pswitch_58
        :pswitch_40
        :pswitch_50
        :pswitch_28
        :pswitch_30
        :pswitch_13
        :pswitch_68
        :pswitch_13
        :pswitch_70
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_60
        :pswitch_18
        :pswitch_13
        :pswitch_20
    .end packed-switch
.end method

.method public doFilterUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-virtual {p0, p1}, Lorg/spongycastle/i18n/filter/HTMLFilter;->doFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
