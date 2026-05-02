.class final Lfreemarker/core/NumberLiteral;
.super Lfreemarker/core/Expression;
.source "NumberLiteral.java"

# interfaces
.implements Lfreemarker/template/TemplateNumberModel;


# instance fields
.field private final value:Ljava/lang/Number;


# direct methods
.method public constructor <init>(Ljava/lang/Number;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 68
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 69
    iput-object p1, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    .line 70
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 73
    new-instance v0, Lfreemarker/template/SimpleNumber;

    iget-object v1, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    return-object v0
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 6
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 102
    new-instance v0, Lfreemarker/core/NumberLiteral;

    iget-object v1, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    invoke-direct {v0, v1}, Lfreemarker/core/NumberLiteral;-><init>(Ljava/lang/Number;)V

    return-object v0
.end method

.method public evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 77
    iget-object v0, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->formatNumber(Ljava/lang/Number;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAsNumber()Ljava/lang/Number;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "the number: \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/NumberLiteral;->value:Ljava/lang/Number;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    invoke-virtual {p0}, Lfreemarker/core/NumberLiteral;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 106
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 114
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 110
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 97
    const/4 v0, 0x1

    return v0
.end method
