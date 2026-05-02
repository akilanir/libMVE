.class final Lfreemarker/core/NumericalOutput;
.super Lfreemarker/core/TemplateElement;
.source "NumericalOutput.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/NumericalOutput$FormatHolder;
    }
.end annotation


# instance fields
.field private final expression:Lfreemarker/core/Expression;

.field private volatile formatCache:Lfreemarker/core/NumericalOutput$FormatHolder;

.field private final hasFormat:Z

.field private final maxFracDigits:I

.field private final minFracDigits:I


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "expression"    # Lfreemarker/core/Expression;

    .prologue
    const/4 v0, 0x0

    .line 73
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 74
    iput-object p1, p0, Lfreemarker/core/NumericalOutput;->expression:Lfreemarker/core/Expression;

    .line 75
    iput-boolean v0, p0, Lfreemarker/core/NumericalOutput;->hasFormat:Z

    .line 76
    iput v0, p0, Lfreemarker/core/NumericalOutput;->minFracDigits:I

    .line 77
    iput v0, p0, Lfreemarker/core/NumericalOutput;->maxFracDigits:I

    .line 78
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;II)V
    .registers 5
    .param p1, "expression"    # Lfreemarker/core/Expression;
    .param p2, "minFracDigits"    # I
    .param p3, "maxFracDigits"    # I

    .prologue
    .line 83
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 84
    iput-object p1, p0, Lfreemarker/core/NumericalOutput;->expression:Lfreemarker/core/Expression;

    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/NumericalOutput;->hasFormat:Z

    .line 86
    iput p2, p0, Lfreemarker/core/NumericalOutput;->minFracDigits:I

    .line 87
    iput p3, p0, Lfreemarker/core/NumericalOutput;->maxFracDigits:I

    .line 88
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 7
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v3, p0, Lfreemarker/core/NumericalOutput;->expression:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v2

    .line 94
    .local v2, "num":Ljava/lang/Number;
    iget-object v1, p0, Lfreemarker/core/NumericalOutput;->formatCache:Lfreemarker/core/NumericalOutput$FormatHolder;

    .line 95
    .local v1, "fmth":Lfreemarker/core/NumericalOutput$FormatHolder;
    if-eqz v1, :cond_16

    iget-object v3, v1, Lfreemarker/core/NumericalOutput$FormatHolder;->locale:Ljava/util/Locale;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4f

    .line 96
    :cond_16
    monitor-enter p0

    .line 97
    :try_start_17
    iget-object v1, p0, Lfreemarker/core/NumericalOutput;->formatCache:Lfreemarker/core/NumericalOutput$FormatHolder;

    .line 98
    if-eqz v1, :cond_27

    iget-object v3, v1, Lfreemarker/core/NumericalOutput$FormatHolder;->locale:Ljava/util/Locale;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4e

    .line 99
    :cond_27
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v3

    invoke-static {v3}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 100
    .local v0, "fmt":Ljava/text/NumberFormat;
    iget-boolean v3, p0, Lfreemarker/core/NumericalOutput;->hasFormat:Z

    if-eqz v3, :cond_5d

    .line 101
    iget v3, p0, Lfreemarker/core/NumericalOutput;->minFracDigits:I

    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setMinimumFractionDigits(I)V

    .line 102
    iget v3, p0, Lfreemarker/core/NumericalOutput;->maxFracDigits:I

    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    .line 107
    :goto_3d
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setGroupingUsed(Z)V

    .line 108
    new-instance v3, Lfreemarker/core/NumericalOutput$FormatHolder;

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Lfreemarker/core/NumericalOutput$FormatHolder;-><init>(Ljava/text/NumberFormat;Ljava/util/Locale;)V

    iput-object v3, p0, Lfreemarker/core/NumericalOutput;->formatCache:Lfreemarker/core/NumericalOutput$FormatHolder;

    .line 109
    iget-object v1, p0, Lfreemarker/core/NumericalOutput;->formatCache:Lfreemarker/core/NumericalOutput$FormatHolder;

    .line 111
    .end local v0    # "fmt":Ljava/text/NumberFormat;
    :cond_4e
    monitor-exit p0
    :try_end_4f
    .catchall {:try_start_17 .. :try_end_4f} :catchall_67

    .line 116
    :cond_4f
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v3

    iget-object v4, v1, Lfreemarker/core/NumericalOutput$FormatHolder;->format:Ljava/text/NumberFormat;

    invoke-virtual {v4, v2}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 117
    return-void

    .line 104
    .restart local v0    # "fmt":Ljava/text/NumberFormat;
    :cond_5d
    const/4 v3, 0x0

    :try_start_5e
    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setMinimumFractionDigits(I)V

    .line 105
    const/16 v3, 0x32

    invoke-virtual {v0, v3}, Ljava/text/NumberFormat;->setMaximumFractionDigits(I)V

    goto :goto_3d

    .line 111
    .end local v0    # "fmt":Ljava/text/NumberFormat;
    :catchall_67
    move-exception v3

    monitor-exit p0
    :try_end_69
    .catchall {:try_start_5e .. :try_end_69} :catchall_67

    throw v3
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "#{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lfreemarker/core/NumericalOutput;->expression:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    iget-boolean v1, p0, Lfreemarker/core/NumericalOutput;->hasFormat:Z

    if-eqz v1, :cond_2d

    .line 123
    const-string v1, " ; "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    const-string v1, "m"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    iget v1, p0, Lfreemarker/core/NumericalOutput;->minFracDigits:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 126
    const-string v1, "M"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    iget v1, p0, Lfreemarker/core/NumericalOutput;->maxFracDigits:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 129
    :cond_2d
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    const-string v0, "#{...}"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 156
    const/4 v0, 0x3

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 169
    packed-switch p1, :pswitch_data_12

    .line 173
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 170
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->CONTENT:Lfreemarker/core/ParameterRole;

    .line 172
    :goto_b
    return-object v0

    .line 171
    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->MINIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 172
    :pswitch_f
    sget-object v0, Lfreemarker/core/ParameterRole;->MAXIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 169
    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 160
    packed-switch p1, :pswitch_data_1c

    .line 164
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 161
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/NumericalOutput;->expression:Lfreemarker/core/Expression;

    .line 163
    :goto_b
    return-object v0

    .line 162
    :pswitch_c
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/NumericalOutput;->minFracDigits:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 163
    :pswitch_14
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/NumericalOutput;->maxFracDigits:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 160
    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_14
    .end packed-switch
.end method

.method heedsOpeningWhitespace()Z
    .registers 2

    .prologue
    .line 138
    const/4 v0, 0x1

    return v0
.end method

.method heedsTrailingWhitespace()Z
    .registers 2

    .prologue
    .line 142
    const/4 v0, 0x1

    return v0
.end method
