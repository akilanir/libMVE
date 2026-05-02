.class final Lfreemarker/core/PropertySetting;
.super Lfreemarker/core/TemplateElement;
.source "PropertySetting.java"


# instance fields
.field private final key:Ljava/lang/String;

.field private final value:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Ljava/lang/String;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lfreemarker/core/Expression;

    .prologue
    .line 71
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 72
    iput-object p1, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    .line 73
    iput-object p2, p0, Lfreemarker/core/PropertySetting;->value:Lfreemarker/core/Expression;

    .line 74
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v2, p0, Lfreemarker/core/PropertySetting;->value:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 103
    .local v0, "mval":Lfreemarker/template/TemplateModel;
    instance-of v2, v0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v2, :cond_16

    .line 104
    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    .end local v0    # "mval":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v1

    .line 112
    .local v1, "strval":Ljava/lang/String;
    :goto_10
    iget-object v2, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Lfreemarker/core/Environment;->setSetting(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void

    .line 105
    .end local v1    # "strval":Ljava/lang/String;
    .restart local v0    # "mval":Lfreemarker/template/TemplateModel;
    :cond_16
    instance-of v2, v0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v2, :cond_28

    .line 106
    check-cast v0, Lfreemarker/template/TemplateBooleanModel;

    .end local v0    # "mval":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v2

    if-eqz v2, :cond_25

    const-string v1, "true"

    .restart local v1    # "strval":Ljava/lang/String;
    :goto_24
    goto :goto_10

    .end local v1    # "strval":Ljava/lang/String;
    :cond_25
    const-string v1, "false"

    goto :goto_24

    .line 107
    .restart local v0    # "mval":Lfreemarker/template/TemplateModel;
    :cond_28
    instance-of v2, v0, Lfreemarker/template/TemplateNumberModel;

    if-eqz v2, :cond_37

    .line 108
    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    .end local v0    # "mval":Lfreemarker/template/TemplateModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "strval":Ljava/lang/String;
    goto :goto_10

    .line 110
    .end local v1    # "strval":Ljava/lang/String;
    .restart local v0    # "mval":Lfreemarker/template/TemplateModel;
    :cond_37
    iget-object v2, p0, Lfreemarker/core/PropertySetting;->value:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "strval":Ljava/lang/String;
    goto :goto_10
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 117
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 118
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/PropertySetting;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 120
    iget-object v1, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 122
    iget-object v1, p0, Lfreemarker/core/PropertySetting;->value:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    if-eqz p1, :cond_32

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    :cond_32
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    const-string v0, "#setting"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 132
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 144
    packed-switch p1, :pswitch_data_10

    .line 147
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 145
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->ITEM_KEY:Lfreemarker/core/ParameterRole;

    .line 146
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->ITEM_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 144
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
    .line 136
    packed-switch p1, :pswitch_data_10

    .line 139
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 137
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    .line 138
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/PropertySetting;->value:Lfreemarker/core/Expression;

    goto :goto_b

    .line 136
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method setLocation(Lfreemarker/template/Template;IIII)V
    .registers 9
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
    .line 80
    invoke-super/range {p0 .. p5}, Lfreemarker/core/TemplateElement;->setLocation(Lfreemarker/template/Template;IIII)V

    .line 82
    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "locale"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "number_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "time_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "date_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "datetime_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "time_zone"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "boolean_format"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "classic_compatible"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    iget-object v0, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    const-string v1, "url_escaping_charset"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_78

    .line 92
    new-instance v0, Lfreemarker/core/ParseException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid setting name, or it\'s not allowed to change the value of the setting with FTL: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/PropertySetting;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1, p3, p2}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;Lfreemarker/template/Template;II)V

    throw v0

    .line 98
    :cond_78
    return-void
.end method
