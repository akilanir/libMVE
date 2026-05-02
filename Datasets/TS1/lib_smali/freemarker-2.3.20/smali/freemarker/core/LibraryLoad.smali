.class public final Lfreemarker/core/LibraryLoad;
.super Lfreemarker/core/TemplateElement;
.source "LibraryLoad.java"


# instance fields
.field private namespace:Ljava/lang/String;

.field private templateName:Lfreemarker/core/Expression;

.field private final templatePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lfreemarker/template/Template;Lfreemarker/core/Expression;Ljava/lang/String;)V
    .registers 8
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "templateName"    # Lfreemarker/core/Expression;
    .param p3, "namespace"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 80
    iput-object p3, p0, Lfreemarker/core/LibraryLoad;->namespace:Ljava/lang/String;

    .line 81
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "templatePath1":Ljava/lang/String;
    if-nez v1, :cond_d

    .line 84
    const-string v1, ""

    .line 86
    :cond_d
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 87
    .local v0, "lastSlash":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1d

    const-string v2, ""

    :goto_18
    iput-object v2, p0, Lfreemarker/core/LibraryLoad;->templatePath:Ljava/lang/String;

    .line 88
    iput-object p2, p0, Lfreemarker/core/LibraryLoad;->templateName:Lfreemarker/core/Expression;

    .line 89
    return-void

    .line 87
    :cond_1d
    const/4 v2, 0x0

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_18
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 14
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 92
    iget-object v5, p0, Lfreemarker/core/LibraryLoad;->templateName:Lfreemarker/core/Expression;

    invoke-virtual {v5, p1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, "templateNameString":Ljava/lang/String;
    :try_start_9
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v5

    if-nez v5, :cond_17

    .line 96
    const-string v5, "://"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v5, :cond_21

    .line 111
    :cond_17
    :goto_17
    invoke-virtual {p1, v4}, Lfreemarker/core/Environment;->getTemplateForImporting(Ljava/lang/String;)Lfreemarker/template/Template;
    :try_end_1a
    .catch Lfreemarker/core/ParseException; {:try_start_9 .. :try_end_1a} :catch_6f
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_1a} :catch_7e

    move-result-object v0

    .line 121
    .local v0, "importedTemplate":Lfreemarker/template/Template;
    iget-object v5, p0, Lfreemarker/core/LibraryLoad;->namespace:Ljava/lang/String;

    invoke-virtual {p1, v0, v5}, Lfreemarker/core/Environment;->importLib(Lfreemarker/template/Template;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    .line 122
    return-void

    .line 99
    .end local v0    # "importedTemplate":Lfreemarker/template/Template;
    :cond_21
    :try_start_21
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_5b

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2f

    if-ne v5, v6, :cond_5b

    .line 100
    iget-object v5, p0, Lfreemarker/core/LibraryLoad;->templatePath:Ljava/lang/String;

    const-string v6, "://"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 101
    .local v3, "protIndex":I
    if-lez v3, :cond_55

    .line 102
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lfreemarker/core/LibraryLoad;->templatePath:Ljava/lang/String;

    const/4 v7, 0x0

    add-int/lit8 v8, v3, 0x2

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_17

    .line 104
    :cond_55
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_17

    .line 108
    .end local v3    # "protIndex":I
    :cond_5b
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lfreemarker/core/LibraryLoad;->templatePath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_6d
    .catch Lfreemarker/core/ParseException; {:try_start_21 .. :try_end_6d} :catch_6f
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_6d} :catch_7e

    move-result-object v4

    goto :goto_17

    .line 113
    :catch_6f
    move-exception v2

    .line 114
    .local v2, "pe":Lfreemarker/core/ParseException;
    new-instance v5, Lfreemarker/core/_MiscTemplateException;

    new-array v6, v11, [Ljava/lang/Object;

    const-string v7, "Error parsing imported template "

    aput-object v7, v6, v9

    aput-object v4, v6, v10

    invoke-direct {v5, v2, p1, v6}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v5

    .line 117
    .end local v2    # "pe":Lfreemarker/core/ParseException;
    :catch_7e
    move-exception v1

    .line 118
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v5, Lfreemarker/core/_MiscTemplateException;

    new-array v6, v11, [Ljava/lang/Object;

    const-string v7, "Error reading imported template "

    aput-object v7, v6, v9

    aput-object v4, v6, v10

    invoke-direct {v5, v1, p1, v6}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v5
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 126
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 127
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/LibraryLoad;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 129
    iget-object v1, p0, Lfreemarker/core/LibraryLoad;->templateName:Lfreemarker/core/Expression;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 130
    const-string v1, " as "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    iget-object v1, p0, Lfreemarker/core/LibraryLoad;->namespace:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    if-eqz p1, :cond_2e

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 133
    :cond_2e
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    const-string v0, "#import"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 141
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 153
    packed-switch p1, :pswitch_data_10

    .line 156
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 154
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->TEMPLATE_NAME:Lfreemarker/core/ParameterRole;

    .line 155
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 153
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
    .line 145
    packed-switch p1, :pswitch_data_10

    .line 148
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 146
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/LibraryLoad;->templateName:Lfreemarker/core/Expression;

    .line 147
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/LibraryLoad;->namespace:Ljava/lang/String;

    goto :goto_b

    .line 145
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method public getTemplateName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lfreemarker/core/LibraryLoad;->templateName:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
