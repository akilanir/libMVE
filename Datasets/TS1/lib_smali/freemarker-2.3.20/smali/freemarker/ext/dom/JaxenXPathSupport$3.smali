.class final Lfreemarker/ext/dom/JaxenXPathSupport$3;
.super Ljava/lang/Object;
.source "JaxenXPathSupport.java"

# interfaces
.implements Lorg/jaxen/VariableContext;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getVariableValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jaxen/UnresolvableException;
        }
    .end annotation

    .prologue
    .line 160
    :try_start_0
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v2

    invoke-virtual {v2, p3}, Lfreemarker/core/Environment;->getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 161
    .local v1, "model":Lfreemarker/template/TemplateModel;
    if-nez v1, :cond_30

    .line 162
    new-instance v2, Lorg/jaxen/UnresolvableException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Variable "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jaxen/UnresolvableException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_29
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_29} :catch_29

    .line 177
    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    :catch_29
    move-exception v0

    .line 178
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v2, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 164
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_30
    :try_start_30
    instance-of v2, v1, Lfreemarker/template/TemplateScalarModel;

    if-eqz v2, :cond_3b

    .line 165
    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v2

    .line 174
    :goto_3a
    return-object v2

    .line 167
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_3b
    instance-of v2, v1, Lfreemarker/template/TemplateNumberModel;

    if-eqz v2, :cond_46

    .line 168
    check-cast v1, Lfreemarker/template/TemplateNumberModel;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v2

    goto :goto_3a

    .line 170
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_46
    instance-of v2, v1, Lfreemarker/template/TemplateDateModel;

    if-eqz v2, :cond_51

    .line 171
    check-cast v1, Lfreemarker/template/TemplateDateModel;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v2

    goto :goto_3a

    .line 173
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_51
    instance-of v2, v1, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v2, :cond_63

    .line 174
    check-cast v1, Lfreemarker/template/TemplateBooleanModel;

    .end local v1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v2

    if-eqz v2, :cond_60

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3a

    :cond_60
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_62
    .catch Lfreemarker/template/TemplateModelException; {:try_start_30 .. :try_end_62} :catch_29

    goto :goto_3a

    .line 180
    .restart local v1    # "model":Lfreemarker/template/TemplateModel;
    :cond_63
    new-instance v2, Lorg/jaxen/UnresolvableException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Variable "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " is not a string, number, date, or boolean"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jaxen/UnresolvableException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
