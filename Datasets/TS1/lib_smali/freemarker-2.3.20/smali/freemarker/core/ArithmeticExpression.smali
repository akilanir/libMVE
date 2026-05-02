.class final Lfreemarker/core/ArithmeticExpression;
.super Lfreemarker/core/Expression;
.source "ArithmeticExpression.java"


# static fields
.field private static final OPERATOR_IMAGES:[C

.field static final TYPE_DIVISION:I = 0x2

.field static final TYPE_MODULO:I = 0x3

.field static final TYPE_MULTIPLICATION:I = 0x1

.field static final TYPE_SUBSTRACTION:I


# instance fields
.field private final lho:Lfreemarker/core/Expression;

.field private final operator:I

.field private final rho:Lfreemarker/core/Expression;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lfreemarker/core/ArithmeticExpression;->OPERATOR_IMAGES:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x2ds
        0x2as
        0x2fs
        0x25s
    .end array-data
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;I)V
    .registers 4
    .param p1, "lho"    # Lfreemarker/core/Expression;
    .param p2, "rho"    # Lfreemarker/core/Expression;
    .param p3, "operator"    # I

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 78
    iput-object p1, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    .line 79
    iput-object p2, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    .line 80
    iput p3, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    .line 81
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 10
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v3, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v1

    .line 86
    .local v1, "lhoNumber":Ljava/lang/Number;
    iget-object v3, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v2

    .line 88
    .local v2, "rhoNumber":Ljava/lang/Number;
    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Lfreemarker/core/Environment;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v0

    .line 92
    .local v0, "ae":Lfreemarker/core/ArithmeticEngine;
    :goto_12
    iget v3, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    packed-switch v3, :pswitch_data_60

    .line 102
    new-instance v3, Lfreemarker/core/_MiscTemplateException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "Unknown operation: "

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v4, v5

    invoke-direct {v3, p0, v4}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v3

    .line 88
    .end local v0    # "ae":Lfreemarker/core/ArithmeticEngine;
    :cond_2f
    invoke-virtual {p0}, Lfreemarker/core/ArithmeticExpression;->getTemplate()Lfreemarker/template/Template;

    move-result-object v3

    invoke-virtual {v3}, Lfreemarker/template/Template;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v0

    goto :goto_12

    .line 94
    .restart local v0    # "ae":Lfreemarker/core/ArithmeticEngine;
    :pswitch_38
    new-instance v3, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0, v1, v2}, Lfreemarker/core/ArithmeticEngine;->subtract(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    .line 100
    :goto_41
    return-object v3

    .line 96
    :pswitch_42
    new-instance v3, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0, v1, v2}, Lfreemarker/core/ArithmeticEngine;->multiply(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_41

    .line 98
    :pswitch_4c
    new-instance v3, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0, v1, v2}, Lfreemarker/core/ArithmeticEngine;->divide(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_41

    .line 100
    :pswitch_56
    new-instance v3, Lfreemarker/template/SimpleNumber;

    invoke-virtual {v0, v1, v2}, Lfreemarker/core/ArithmeticEngine;->modulus(Ljava/lang/Number;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_41

    .line 92
    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_38
        :pswitch_42
        :pswitch_4c
        :pswitch_56
    .end packed-switch
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 8
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 121
    new-instance v0, Lfreemarker/core/ArithmeticExpression;

    iget-object v1, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    iget v3, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/ArithmeticExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;I)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x20

    .line 108
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Lfreemarker/core/ArithmeticExpression;->OPERATOR_IMAGES:[C

    iget v2, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    aget-char v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 3

    .prologue
    .line 112
    sget-object v0, Lfreemarker/core/ArithmeticExpression;->OPERATOR_IMAGES:[C

    iget v1, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    aget-char v0, v0, v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 128
    const/4 v0, 0x3

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 141
    packed-switch p1, :pswitch_data_12

    .line 145
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 142
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 144
    :goto_b
    return-object v0

    .line 143
    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 144
    :pswitch_f
    sget-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 141
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
    .line 132
    packed-switch p1, :pswitch_data_18

    .line 136
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 133
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    .line 135
    :goto_b
    return-object v0

    .line 134
    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    goto :goto_b

    .line 135
    :pswitch_f
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/ArithmeticExpression;->operator:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 132
    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
        :pswitch_f
    .end packed-switch
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lfreemarker/core/ArithmeticExpression;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_14

    iget-object v0, p0, Lfreemarker/core/ArithmeticExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/ArithmeticExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
