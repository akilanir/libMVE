.class Lfreemarker/core/EscapeBlock;
.super Lfreemarker/core/TemplateElement;
.source "EscapeBlock.java"


# instance fields
.field private escapedExpr:Lfreemarker/core/Expression;

.field private final expr:Lfreemarker/core/Expression;

.field private final variable:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 4
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "expr"    # Lfreemarker/core/Expression;
    .param p3, "escapedExpr"    # Lfreemarker/core/Expression;

    .prologue
    .line 71
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 72
    iput-object p1, p0, Lfreemarker/core/EscapeBlock;->variable:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lfreemarker/core/EscapeBlock;->expr:Lfreemarker/core/Expression;

    .line 74
    iput-object p3, p0, Lfreemarker/core/EscapeBlock;->escapedExpr:Lfreemarker/core/Expression;

    .line 75
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
    .line 84
    iget-object v0, p0, Lfreemarker/core/EscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_9

    .line 85
    iget-object v0, p0, Lfreemarker/core/EscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 87
    :cond_9
    return-void
.end method

.method doEscape(Lfreemarker/core/Expression;)Lfreemarker/core/Expression;
    .registers 5
    .param p1, "expression"    # Lfreemarker/core/Expression;

    .prologue
    .line 90
    iget-object v0, p0, Lfreemarker/core/EscapeBlock;->escapedExpr:Lfreemarker/core/Expression;

    iget-object v1, p0, Lfreemarker/core/EscapeBlock;->variable:Ljava/lang/String;

    new-instance v2, Lfreemarker/core/Expression$ReplacemenetState;

    invoke-direct {v2}, Lfreemarker/core/Expression$ReplacemenetState;-><init>()V

    invoke-virtual {v0, v1, p1, v2}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v0

    return-object v0
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    const/16 v3, 0x3e

    .line 94
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 95
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_e

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 96
    :cond_e
    invoke-virtual {p0}, Lfreemarker/core/EscapeBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/EscapeBlock;->variable:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " as "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/EscapeBlock;->expr:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    if-eqz p1, :cond_52

    .line 98
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/EscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v2}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "</"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/core/EscapeBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 100
    :cond_52
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    const-string v0, "#escape"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 124
    packed-switch p1, :pswitch_data_10

    .line 127
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 125
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->PLACEHOLDER_VARIABLE:Lfreemarker/core/ParameterRole;

    .line 126
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->EXPRESSION_TEMPLATE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 124
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 116
    packed-switch p1, :pswitch_data_10

    .line 119
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 117
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/EscapeBlock;->variable:Ljava/lang/String;

    .line 118
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/EscapeBlock;->expr:Lfreemarker/core/Expression;

    goto :goto_b

    .line 116
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method setContent(Lfreemarker/core/TemplateElement;)V
    .registers 3
    .param p1, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 78
    iput-object p1, p0, Lfreemarker/core/EscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 80
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/EscapeBlock;->escapedExpr:Lfreemarker/core/Expression;

    .line 81
    return-void
.end method
