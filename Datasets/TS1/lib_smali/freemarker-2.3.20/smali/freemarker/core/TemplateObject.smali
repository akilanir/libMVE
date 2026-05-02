.class public abstract Lfreemarker/core/TemplateObject;
.super Ljava/lang/Object;
.source "TemplateObject.java"


# static fields
.field static final RUNTIME_EVAL_LINE_DISPLACEMENT:I = -0x3b9aca00


# instance fields
.field beginColumn:I

.field beginLine:I

.field endColumn:I

.field endLine:I

.field private template:Lfreemarker/template/Template;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(II)Z
    .registers 5
    .param p1, "column"    # I
    .param p2, "line"    # I

    .prologue
    const/4 v0, 0x0

    .line 182
    iget v1, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    if-lt p2, v1, :cond_9

    iget v1, p0, Lfreemarker/core/TemplateObject;->endLine:I

    if-le p2, v1, :cond_a

    .line 195
    :cond_9
    :goto_9
    return v0

    .line 185
    :cond_a
    iget v1, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    if-ne p2, v1, :cond_12

    .line 186
    iget v1, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    if-lt p1, v1, :cond_9

    .line 190
    :cond_12
    iget v1, p0, Lfreemarker/core/TemplateObject;->endLine:I

    if-ne p2, v1, :cond_1a

    .line 191
    iget v1, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    if-gt p1, v1, :cond_9

    .line 195
    :cond_1a
    const/4 v0, 0x1

    goto :goto_9
.end method

.method copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;
    .registers 3
    .param p1, "from"    # Lfreemarker/core/TemplateObject;

    .prologue
    .line 205
    iget-object v0, p1, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    iput-object v0, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    .line 206
    iget v0, p1, Lfreemarker/core/TemplateObject;->beginColumn:I

    iput v0, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    .line 207
    iget v0, p1, Lfreemarker/core/TemplateObject;->beginLine:I

    iput v0, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    .line 208
    iget v0, p1, Lfreemarker/core/TemplateObject;->endColumn:I

    iput v0, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    .line 209
    iget v0, p1, Lfreemarker/core/TemplateObject;->endLine:I

    iput v0, p0, Lfreemarker/core/TemplateObject;->endLine:I

    .line 210
    return-object p0
.end method

.method public final getBeginColumn()I
    .registers 2

    .prologue
    .line 112
    iget v0, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    return v0
.end method

.method public final getBeginLine()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    return v0
.end method

.method public abstract getCanonicalForm()Ljava/lang/String;
.end method

.method public final getEndColumn()I
    .registers 2

    .prologue
    .line 120
    iget v0, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    return v0
.end method

.method public final getEndLine()I
    .registers 2

    .prologue
    .line 124
    iget v0, p0, Lfreemarker/core/TemplateObject;->endLine:I

    return v0
.end method

.method public getEndLocation()Ljava/lang/String;
    .registers 4

    .prologue
    .line 144
    iget-object v0, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    iget v1, p0, Lfreemarker/core/TemplateObject;->endLine:I

    iget v2, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    invoke-static {v0, v1, v2}, Lfreemarker/core/MessageUtil;->formatLocationForEvaluationError(Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEndLocationQuoted()Ljava/lang/String;
    .registers 2

    .prologue
    .line 152
    invoke-virtual {p0}, Lfreemarker/core/TemplateObject;->getEndLocation()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method abstract getNodeTypeSymbol()Ljava/lang/String;
.end method

.method abstract getParameterCount()I
.end method

.method abstract getParameterRole(I)Lfreemarker/core/ParameterRole;
.end method

.method abstract getParameterValue(I)Ljava/lang/Object;
.end method

.method public final getSource()Ljava/lang/String;
    .registers 7

    .prologue
    .line 157
    iget-object v1, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    if-eqz v1, :cond_15

    .line 158
    iget-object v1, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    iget v2, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    iget v3, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    iget v4, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    iget v5, p0, Lfreemarker/core/TemplateObject;->endLine:I

    invoke-virtual {v1, v2, v3, v4, v5}, Lfreemarker/template/Template;->getSource(IIII)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "s":Ljava/lang/String;
    :goto_12
    if-eqz v0, :cond_17

    .end local v0    # "s":Ljava/lang/String;
    :goto_14
    return-object v0

    .line 160
    :cond_15
    const/4 v0, 0x0

    .restart local v0    # "s":Ljava/lang/String;
    goto :goto_12

    .line 164
    :cond_17
    invoke-virtual {p0}, Lfreemarker/core/TemplateObject;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method public getStartLocation()Ljava/lang/String;
    .registers 4

    .prologue
    .line 132
    iget-object v0, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    iget v1, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    iget v2, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    invoke-static {v0, v1, v2}, Lfreemarker/core/MessageUtil;->formatLocationForEvaluationError(Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStartLocationQuoted()Ljava/lang/String;
    .registers 2

    .prologue
    .line 140
    invoke-virtual {p0}, Lfreemarker/core/TemplateObject;->getStartLocation()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTemplate()Lfreemarker/template/Template;
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    return-object v0
.end method

.method setLocation(Lfreemarker/template/Template;IIII)V
    .registers 6
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "beginColumn"    # I
    .param p3, "beginLine"    # I
    .param p4, "endColumn"    # I
    .param p5, "endLine"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 104
    iput-object p1, p0, Lfreemarker/core/TemplateObject;->template:Lfreemarker/template/Template;

    .line 105
    iput p2, p0, Lfreemarker/core/TemplateObject;->beginColumn:I

    .line 106
    iput p3, p0, Lfreemarker/core/TemplateObject;->beginLine:I

    .line 107
    iput p4, p0, Lfreemarker/core/TemplateObject;->endColumn:I

    .line 108
    iput p5, p0, Lfreemarker/core/TemplateObject;->endLine:I

    .line 109
    return-void
.end method

.method final setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V
    .registers 10
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "begin"    # Lfreemarker/core/TemplateObject;
    .param p3, "end"    # Lfreemarker/core/TemplateObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 97
    iget v2, p2, Lfreemarker/core/TemplateObject;->beginColumn:I

    iget v3, p2, Lfreemarker/core/TemplateObject;->beginLine:I

    iget v4, p3, Lfreemarker/core/TemplateObject;->endColumn:I

    iget v5, p3, Lfreemarker/core/TemplateObject;->endLine:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/TemplateObject;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 98
    return-void
.end method

.method final setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/Token;)V
    .registers 10
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "begin"    # Lfreemarker/core/TemplateObject;
    .param p3, "end"    # Lfreemarker/core/Token;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 90
    iget v2, p2, Lfreemarker/core/TemplateObject;->beginColumn:I

    iget v3, p2, Lfreemarker/core/TemplateObject;->beginLine:I

    iget v4, p3, Lfreemarker/core/Token;->endColumn:I

    iget v5, p3, Lfreemarker/core/Token;->endLine:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/TemplateObject;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 91
    return-void
.end method

.method final setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/TemplateObject;)V
    .registers 10
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "begin"    # Lfreemarker/core/Token;
    .param p3, "end"    # Lfreemarker/core/TemplateObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 83
    iget v2, p2, Lfreemarker/core/Token;->beginColumn:I

    iget v3, p2, Lfreemarker/core/Token;->beginLine:I

    iget v4, p3, Lfreemarker/core/TemplateObject;->endColumn:I

    iget v5, p3, Lfreemarker/core/TemplateObject;->endLine:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/TemplateObject;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 84
    return-void
.end method

.method final setLocation(Lfreemarker/template/Template;Lfreemarker/core/Token;Lfreemarker/core/Token;)V
    .registers 10
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "begin"    # Lfreemarker/core/Token;
    .param p3, "end"    # Lfreemarker/core/Token;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 76
    iget v2, p2, Lfreemarker/core/Token;->beginColumn:I

    iget v3, p2, Lfreemarker/core/Token;->beginLine:I

    iget v4, p3, Lfreemarker/core/Token;->endColumn:I

    iget v5, p3, Lfreemarker/core/Token;->endLine:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/TemplateObject;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 77
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 170
    :try_start_0
    invoke-virtual {p0}, Lfreemarker/core/TemplateObject;->getSource()Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_7

    move-result-object v1

    .line 174
    .local v1, "s":Ljava/lang/String;
    :goto_4
    if-eqz v1, :cond_a

    .end local v1    # "s":Ljava/lang/String;
    :goto_6
    return-object v1

    .line 171
    :catch_7
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_4

    .line 174
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_a
    invoke-virtual {p0}, Lfreemarker/core/TemplateObject;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    goto :goto_6
.end method
