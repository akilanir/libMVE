.class final Lfreemarker/core/RecurseNode;
.super Lfreemarker/core/TemplateElement;
.source "RecurseNode.java"


# instance fields
.field namespaces:Lfreemarker/core/Expression;

.field targetNode:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "targetNode"    # Lfreemarker/core/Expression;
    .param p2, "namespaces"    # Lfreemarker/core/Expression;

    .prologue
    .line 73
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 74
    iput-object p1, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    .line 75
    iput-object p2, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    .line 76
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 79
    iget-object v4, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    if-nez v4, :cond_16

    move-object v0, v3

    .line 80
    .local v0, "node":Lfreemarker/template/TemplateModel;
    :goto_6
    if-eqz v0, :cond_1d

    instance-of v4, v0, Lfreemarker/template/TemplateNodeModel;

    if-nez v4, :cond_1d

    .line 81
    new-instance v3, Lfreemarker/core/UnexpectedTypeException;

    iget-object v4, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    const-string v5, "node"

    invoke-direct {v3, v4, v0, v5, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 79
    .end local v0    # "node":Lfreemarker/template/TemplateModel;
    :cond_16
    iget-object v4, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_6

    .line 84
    .restart local v0    # "node":Lfreemarker/template/TemplateModel;
    :cond_1d
    iget-object v4, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    if-nez v4, :cond_4a

    move-object v1, v3

    .line 85
    .local v1, "nss":Lfreemarker/template/TemplateModel;
    :goto_22
    iget-object v4, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    instance-of v4, v4, Lfreemarker/core/StringLiteral;

    if-eqz v4, :cond_51

    .line 86
    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    .end local v1    # "nss":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4, v3}, Lfreemarker/core/Environment;->importLib(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    .line 91
    .restart local v1    # "nss":Lfreemarker/template/TemplateModel;
    :cond_32
    :goto_32
    if-eqz v1, :cond_42

    .line 92
    instance-of v3, v1, Lfreemarker/template/TemplateHashModel;

    if-eqz v3, :cond_60

    .line 93
    new-instance v2, Lfreemarker/template/SimpleSequence;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 94
    .local v2, "ss":Lfreemarker/template/SimpleSequence;
    invoke-virtual {v2, v1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 95
    move-object v1, v2

    .line 107
    .end local v2    # "ss":Lfreemarker/template/SimpleSequence;
    :cond_42
    check-cast v0, Lfreemarker/template/TemplateNodeModel;

    .end local v0    # "node":Lfreemarker/template/TemplateModel;
    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    .end local v1    # "nss":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v0, v1}, Lfreemarker/core/Environment;->recurse(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V

    .line 108
    return-void

    .line 84
    .restart local v0    # "node":Lfreemarker/template/TemplateModel;
    :cond_4a
    iget-object v4, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_22

    .line 88
    .restart local v1    # "nss":Lfreemarker/template/TemplateModel;
    :cond_51
    iget-object v3, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    instance-of v3, v3, Lfreemarker/core/ListLiteral;

    if-eqz v3, :cond_32

    .line 89
    iget-object v3, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    check-cast v3, Lfreemarker/core/ListLiteral;

    invoke-virtual {v3, p1}, Lfreemarker/core/ListLiteral;->evaluateStringsToNamespaces(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v1

    goto :goto_32

    .line 97
    :cond_60
    instance-of v3, v1, Lfreemarker/template/TemplateSequenceModel;

    if-nez v3, :cond_42

    .line 98
    iget-object v3, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    if-eqz v3, :cond_72

    .line 99
    new-instance v3, Lfreemarker/core/UnexpectedTypeException;

    iget-object v4, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    const-string v5, "sequence"

    invoke-direct {v3, v4, v1, v5, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 102
    :cond_72
    new-instance v3, Lfreemarker/core/_MiscTemplateException;

    const-string v4, "Expecting a sequence of namespaces after \"using\""

    invoke-direct {v3, p1, v4}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v3
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 111
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 112
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 113
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/RecurseNode;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    iget-object v1, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    if-eqz v1, :cond_25

    .line 115
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 116
    iget-object v1, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    :cond_25
    iget-object v1, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    if-eqz v1, :cond_37

    .line 119
    const-string v1, " using "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    iget-object v1, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    :cond_37
    if-eqz p1, :cond_3e

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    :cond_3e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    const-string v0, "#recurse"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 143
    packed-switch p1, :pswitch_data_10

    .line 146
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 144
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->NODE:Lfreemarker/core/ParameterRole;

    .line 145
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 143
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
    .line 135
    packed-switch p1, :pswitch_data_10

    .line 138
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 136
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/RecurseNode;->targetNode:Lfreemarker/core/Expression;

    .line 137
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/RecurseNode;->namespaces:Lfreemarker/core/Expression;

    goto :goto_b

    .line 135
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method
