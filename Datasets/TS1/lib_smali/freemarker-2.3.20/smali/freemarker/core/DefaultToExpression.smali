.class Lfreemarker/core/DefaultToExpression;
.super Lfreemarker/core/Expression;
.source "DefaultToExpression.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/DefaultToExpression$1;,
        Lfreemarker/core/DefaultToExpression$EmptyStringAndSequence;
    }
.end annotation


# static fields
.field private static final EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

.field static final EMPTY_STRING_AND_SEQUENCE:Lfreemarker/template/TemplateModel;


# instance fields
.field private final lho:Lfreemarker/core/Expression;

.field private final rho:Lfreemarker/core/Expression;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 67
    new-instance v0, Lfreemarker/template/SimpleCollection;

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleCollection;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lfreemarker/core/DefaultToExpression;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    .line 95
    new-instance v0, Lfreemarker/core/DefaultToExpression$EmptyStringAndSequence;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lfreemarker/core/DefaultToExpression$EmptyStringAndSequence;-><init>(Lfreemarker/core/DefaultToExpression$1;)V

    sput-object v0, Lfreemarker/core/DefaultToExpression;->EMPTY_STRING_AND_SEQUENCE:Lfreemarker/template/TemplateModel;

    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "lho"    # Lfreemarker/core/Expression;
    .param p2, "rho"    # Lfreemarker/core/Expression;

    .prologue
    .line 99
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 100
    iput-object p1, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    .line 101
    iput-object p2, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    .line 102
    return-void
.end method

.method static access$000()Lfreemarker/template/TemplateCollectionModel;
    .registers 1

    .prologue
    .line 65
    sget-object v0, Lfreemarker/core/DefaultToExpression;->EMPTY_COLLECTION:Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v3, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    instance-of v3, v3, Lfreemarker/core/ParentheticalExpression;

    if-eqz v3, :cond_22

    .line 107
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    move-result v1

    .line 109
    .local v1, "lastFIRE":Z
    :try_start_b
    iget-object v3, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_10
    .catch Lfreemarker/core/InvalidReferenceException; {:try_start_b .. :try_end_10} :catch_17
    .catchall {:try_start_b .. :try_end_10} :catchall_1d

    move-result-object v2

    .line 113
    .local v2, "left":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 119
    .end local v1    # "lastFIRE":Z
    :goto_14
    if-eqz v2, :cond_29

    .line 121
    .end local v2    # "left":Lfreemarker/template/TemplateModel;
    :goto_16
    return-object v2

    .line 110
    .restart local v1    # "lastFIRE":Z
    :catch_17
    move-exception v0

    .line 111
    .local v0, "ire":Lfreemarker/core/InvalidReferenceException;
    const/4 v2, 0x0

    .line 113
    .restart local v2    # "left":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    goto :goto_14

    .end local v0    # "ire":Lfreemarker/core/InvalidReferenceException;
    .end local v2    # "left":Lfreemarker/template/TemplateModel;
    :catchall_1d
    move-exception v3

    invoke-virtual {p1, v1}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    throw v3

    .line 116
    .end local v1    # "lastFIRE":Z
    :cond_22
    iget-object v3, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .restart local v2    # "left":Lfreemarker/template/TemplateModel;
    goto :goto_14

    .line 120
    :cond_29
    iget-object v3, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    if-nez v3, :cond_30

    sget-object v2, Lfreemarker/core/DefaultToExpression;->EMPTY_STRING_AND_SEQUENCE:Lfreemarker/template/TemplateModel;

    goto :goto_16

    .line 121
    :cond_30
    iget-object v3, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v3, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    goto :goto_16
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 129
    new-instance v1, Lfreemarker/core/DefaultToExpression;

    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v0

    :goto_12
    invoke-direct {v1, v2, v0}, Lfreemarker/core/DefaultToExpression;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    return-object v1

    :cond_16
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 4

    .prologue
    const/16 v2, 0x21

    .line 137
    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    if-nez v0, :cond_1e

    .line 138
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 140
    :goto_1d
    return-object v0

    :cond_1e
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1d
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 144
    const-string v0, "...!..."

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 148
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 160
    invoke-static {p1}, Lfreemarker/core/ParameterRole;->forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;

    move-result-object v0

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 152
    packed-switch p1, :pswitch_data_10

    .line 155
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 153
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->lho:Lfreemarker/core/Expression;

    .line 154
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/DefaultToExpression;->rho:Lfreemarker/core/Expression;

    goto :goto_b

    .line 152
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method
