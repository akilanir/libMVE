.class final Lfreemarker/core/IteratorBlock;
.super Lfreemarker/core/TemplateElement;
.source "IteratorBlock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/IteratorBlock$Context;
    }
.end annotation


# instance fields
.field private isForEach:Z

.field private listSource:Lfreemarker/core/Expression;

.field private loopVariableName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/TemplateElement;Z)V
    .registers 5
    .param p1, "listExpression"    # Lfreemarker/core/Expression;
    .param p2, "indexName"    # Ljava/lang/String;
    .param p3, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .param p4, "isForEach"    # Z

    .prologue
    .line 85
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 86
    iput-object p1, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    .line 87
    iput-object p2, p0, Lfreemarker/core/IteratorBlock;->loopVariableName:Ljava/lang/String;

    .line 88
    iput-boolean p4, p0, Lfreemarker/core/IteratorBlock;->isForEach:Z

    .line 89
    iput-object p3, p0, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 90
    return-void
.end method

.method static access$000(Lfreemarker/core/IteratorBlock;)Lfreemarker/core/Expression;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/IteratorBlock;

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    return-object v0
.end method

.method static access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/IteratorBlock;

    .prologue
    .line 70
    iget-object v0, p0, Lfreemarker/core/IteratorBlock;->loopVariableName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 95
    .local v0, "baseModel":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_14

    .line 96
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 104
    :goto_e
    return-void

    .line 100
    :cond_f
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    invoke-virtual {v1, v0, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    .line 103
    :cond_14
    new-instance v1, Lfreemarker/core/IteratorBlock$Context;

    invoke-direct {v1, p0, v0}, Lfreemarker/core/IteratorBlock$Context;-><init>(Lfreemarker/core/IteratorBlock;Lfreemarker/template/TemplateModel;)V

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->visitIteratorBlock(Lfreemarker/core/IteratorBlock$Context;)V

    goto :goto_e
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 107
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 108
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/IteratorBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 111
    iget-boolean v1, p0, Lfreemarker/core/IteratorBlock;->isForEach:Z

    if-eqz v1, :cond_59

    .line 112
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->loopVariableName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    const-string v1, " in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    :goto_2f
    if-eqz p1, :cond_54

    .line 122
    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_43

    .line 124
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    :cond_43
    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    invoke-virtual {p0}, Lfreemarker/core/IteratorBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 130
    :cond_54
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 117
    :cond_59
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    const-string v1, " as "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    iget-object v1, p0, Lfreemarker/core/IteratorBlock;->loopVariableName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2f
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    iget-boolean v0, p0, Lfreemarker/core/IteratorBlock;->isForEach:Z

    if-eqz v0, :cond_7

    const-string v0, "#foreach"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "#list"

    goto :goto_6
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 134
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 146
    packed-switch p1, :pswitch_data_10

    .line 149
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 147
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->LIST_SOURCE:Lfreemarker/core/ParameterRole;

    .line 148
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->TARGET_LOOP_VARIABLE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 146
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
    .line 138
    packed-switch p1, :pswitch_data_10

    .line 141
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 139
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/IteratorBlock;->listSource:Lfreemarker/core/Expression;

    .line 140
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/IteratorBlock;->loopVariableName:Ljava/lang/String;

    goto :goto_b

    .line 138
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method
