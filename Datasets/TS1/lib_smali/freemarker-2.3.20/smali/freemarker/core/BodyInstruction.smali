.class final Lfreemarker/core/BodyInstruction;
.super Lfreemarker/core/TemplateElement;
.source "BodyInstruction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/BodyInstruction$Context;
    }
.end annotation


# instance fields
.field private bodyParameters:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .registers 2
    .param p1, "bodyParameters"    # Ljava/util/List;

    .prologue
    .line 74
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 75
    iput-object p1, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    .line 76
    return-void
.end method

.method static access$000(Lfreemarker/core/BodyInstruction;)Ljava/util/List;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/BodyInstruction;

    .prologue
    .line 68
    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    return-object v0
.end method

.method private checkIndex(I)V
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 129
    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_12

    .line 130
    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 132
    :cond_12
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lfreemarker/core/BodyInstruction$Context;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/BodyInstruction$Context;-><init>(Lfreemarker/core/BodyInstruction;Lfreemarker/core/Environment;)V

    .line 93
    .local v0, "bodyContext":Lfreemarker/core/BodyInstruction$Context;
    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/BodyInstruction$Context;)V

    .line 94
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    .line 97
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 98
    .local v1, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 99
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/BodyInstruction;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    iget-object v2, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    if-eqz v2, :cond_31

    .line 101
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    iget-object v2, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_31

    .line 102
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 103
    iget-object v2, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 101
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 106
    .end local v0    # "i":I
    :cond_31
    if-eqz p1, :cond_38

    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 107
    :cond_38
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method getBodyParameters()Ljava/util/List;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    const-string v0, "#nested"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 124
    invoke-direct {p0, p1}, Lfreemarker/core/BodyInstruction;->checkIndex(I)V

    .line 125
    sget-object v0, Lfreemarker/core/ParameterRole;->PASSED_VALUE:Lfreemarker/core/ParameterRole;

    return-object v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lfreemarker/core/BodyInstruction;->checkIndex(I)V

    .line 120
    iget-object v0, p0, Lfreemarker/core/BodyInstruction;->bodyParameters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
