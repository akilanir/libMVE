.class final Lfreemarker/core/Case;
.super Lfreemarker/core/TemplateElement;
.source "Case.java"


# instance fields
.field final TYPE_CASE:I

.field final TYPE_DEFAULT:I

.field condition:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;)V
    .registers 4
    .param p1, "matchingValue"    # Lfreemarker/core/Expression;
    .param p2, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 70
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/Case;->TYPE_CASE:I

    .line 65
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/Case;->TYPE_DEFAULT:I

    .line 71
    iput-object p1, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    .line 72
    iput-object p2, p0, Lfreemarker/core/Case;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 73
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    iget-object v0, p0, Lfreemarker/core/Case;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_9

    .line 79
    iget-object v0, p0, Lfreemarker/core/Case;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 81
    :cond_9
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 84
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 85
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 86
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/Case;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 87
    iget-object v1, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-eqz v1, :cond_25

    .line 88
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 89
    iget-object v1, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    :cond_25
    if-eqz p1, :cond_39

    .line 92
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 93
    iget-object v1, p0, Lfreemarker/core/Case;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_39

    iget-object v1, p0, Lfreemarker/core/Case;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    :cond_39
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-eqz v0, :cond_7

    const-string v0, "#case"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "#default"

    goto :goto_6
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 103
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 115
    packed-switch p1, :pswitch_data_10

    .line 118
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 116
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->CONDITION:Lfreemarker/core/ParameterRole;

    .line 117
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 115
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 107
    packed-switch p1, :pswitch_data_1a

    .line 110
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 108
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    .line 109
    :goto_b
    return-object v0

    :pswitch_c
    new-instance v1, Ljava/lang/Integer;

    iget-object v0, p0, Lfreemarker/core/Case;->condition:Lfreemarker/core/Expression;

    if-eqz v0, :cond_18

    const/4 v0, 0x0

    :goto_13
    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    move-object v0, v1

    goto :goto_b

    :cond_18
    const/4 v0, 0x1

    goto :goto_13

    .line 107
    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method
