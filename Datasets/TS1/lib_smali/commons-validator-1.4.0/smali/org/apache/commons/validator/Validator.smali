.class public Lorg/apache/commons/validator/Validator;
.super Ljava/lang/Object;
.source "Validator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final BEAN_PARAM:Ljava/lang/String; = "java.lang.Object"

.field public static final FIELD_PARAM:Ljava/lang/String; = "org.apache.commons.validator.Field"

.field public static final FORM_PARAM:Ljava/lang/String; = "org.apache.commons.validator.Form"

.field public static final LOCALE_PARAM:Ljava/lang/String; = "java.util.Locale"

.field public static final VALIDATOR_ACTION_PARAM:Ljava/lang/String; = "org.apache.commons.validator.ValidatorAction"

.field public static final VALIDATOR_PARAM:Ljava/lang/String; = "org.apache.commons.validator.Validator"

.field public static final VALIDATOR_RESULTS_PARAM:Ljava/lang/String; = "org.apache.commons.validator.ValidatorResults"

.field private static final serialVersionUID:J = -0x62cd41a337785bdbL


# instance fields
.field protected transient classLoader:Ljava/lang/ClassLoader;

.field protected fieldName:Ljava/lang/String;

.field protected formName:Ljava/lang/String;

.field protected onlyReturnErrors:Z

.field protected page:I

.field protected parameters:Ljava/util/Map;

.field protected resources:Lorg/apache/commons/validator/ValidatorResources;

.field protected useContextClassLoader:Z


# direct methods
.method public constructor <init>(Lorg/apache/commons/validator/ValidatorResources;)V
    .registers 3
    .param p1, "resources"    # Lorg/apache/commons/validator/ValidatorResources;

    .prologue
    .line 146
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/validator/Validator;-><init>(Lorg/apache/commons/validator/ValidatorResources;Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/ValidatorResources;Ljava/lang/String;)V
    .registers 6
    .param p1, "resources"    # Lorg/apache/commons/validator/ValidatorResources;
    .param p2, "formName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    .line 99
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 105
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    .line 116
    iput v2, p0, Lorg/apache/commons/validator/Validator;->page:I

    .line 124
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->classLoader:Ljava/lang/ClassLoader;

    .line 130
    iput-boolean v2, p0, Lorg/apache/commons/validator/Validator;->useContextClassLoader:Z

    .line 135
    iput-boolean v2, p0, Lorg/apache/commons/validator/Validator;->onlyReturnErrors:Z

    .line 159
    if-nez p1, :cond_24

    .line 160
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Resources cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :cond_24
    iput-object p1, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    .line 164
    iput-object p2, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 165
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/validator/ValidatorResources;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "resources"    # Lorg/apache/commons/validator/ValidatorResources;
    .param p2, "formName"    # Ljava/lang/String;
    .param p3, "fieldName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    .line 99
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 105
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    .line 116
    iput v2, p0, Lorg/apache/commons/validator/Validator;->page:I

    .line 124
    iput-object v1, p0, Lorg/apache/commons/validator/Validator;->classLoader:Ljava/lang/ClassLoader;

    .line 130
    iput-boolean v2, p0, Lorg/apache/commons/validator/Validator;->useContextClassLoader:Z

    .line 135
    iput-boolean v2, p0, Lorg/apache/commons/validator/Validator;->onlyReturnErrors:Z

    .line 179
    if-nez p1, :cond_24

    .line 180
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Resources cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_24
    iput-object p1, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    .line 184
    iput-object p2, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 185
    iput-object p3, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    .line 186
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 269
    iput-object v0, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 270
    iput-object v0, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    .line 271
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    .line 272
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/validator/Validator;->page:I

    .line 273
    return-void
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .registers 3

    .prologue
    .line 308
    iget-object v1, p0, Lorg/apache/commons/validator/Validator;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_7

    .line 309
    iget-object v0, p0, Lorg/apache/commons/validator/Validator;->classLoader:Ljava/lang/ClassLoader;

    .line 319
    :cond_6
    :goto_6
    return-object v0

    .line 312
    :cond_7
    iget-boolean v1, p0, Lorg/apache/commons/validator/Validator;->useContextClassLoader:Z

    if-eqz v1, :cond_15

    .line 313
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 314
    .local v0, "contextLoader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_6

    .line 319
    .end local v0    # "contextLoader":Ljava/lang/ClassLoader;
    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_6
.end method

.method public getFormName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    return-object v0
.end method

.method public getOnlyReturnErrors()Z
    .registers 2

    .prologue
    .line 368
    iget-boolean v0, p0, Lorg/apache/commons/validator/Validator;->onlyReturnErrors:Z

    return v0
.end method

.method public getPage()I
    .registers 2

    .prologue
    .line 246
    iget v0, p0, Lorg/apache/commons/validator/Validator;->page:I

    return v0
.end method

.method public getParameterValue(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "parameterClassName"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getUseContextClassLoader()Z
    .registers 2

    .prologue
    .line 280
    iget-boolean v0, p0, Lorg/apache/commons/validator/Validator;->useContextClassLoader:Z

    return v0
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 2
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 330
    iput-object p1, p0, Lorg/apache/commons/validator/Validator;->classLoader:Ljava/lang/ClassLoader;

    .line 331
    return-void
.end method

.method public setFieldName(Ljava/lang/String;)V
    .registers 2
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    .line 237
    return-void
.end method

.method public setFormName(Ljava/lang/String;)V
    .registers 2
    .param p1, "formName"    # Ljava/lang/String;

    .prologue
    .line 226
    iput-object p1, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    .line 227
    return-void
.end method

.method public setOnlyReturnErrors(Z)V
    .registers 2
    .param p1, "onlyReturnErrors"    # Z

    .prologue
    .line 378
    iput-boolean p1, p0, Lorg/apache/commons/validator/Validator;->onlyReturnErrors:Z

    .line 379
    return-void
.end method

.method public setPage(I)V
    .registers 2
    .param p1, "page"    # I

    .prologue
    .line 256
    iput p1, p0, Lorg/apache/commons/validator/Validator;->page:I

    .line 257
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "parameterClassName"    # Ljava/lang/String;
    .param p2, "parameterValue"    # Ljava/lang/Object;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    return-void
.end method

.method public setUseContextClassLoader(Z)V
    .registers 2
    .param p1, "use"    # Z

    .prologue
    .line 293
    iput-boolean p1, p0, Lorg/apache/commons/validator/Validator;->useContextClassLoader:Z

    .line 294
    return-void
.end method

.method public validate()Lorg/apache/commons/validator/ValidatorResults;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 342
    const-string v2, "java.util.Locale"

    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/Validator;->getParameterValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Locale;

    .line 344
    .local v1, "locale":Ljava/util/Locale;
    if-nez v1, :cond_e

    .line 345
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 348
    :cond_e
    const-string v2, "org.apache.commons.validator.Validator"

    invoke-virtual {p0, v2, p0}, Lorg/apache/commons/validator/Validator;->setParameter(Ljava/lang/String;Ljava/lang/Object;)V

    .line 350
    iget-object v2, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    iget-object v3, p0, Lorg/apache/commons/validator/Validator;->formName:Ljava/lang/String;

    invoke-virtual {v2, v1, v3}, Lorg/apache/commons/validator/ValidatorResources;->getForm(Ljava/util/Locale;Ljava/lang/String;)Lorg/apache/commons/validator/Form;

    move-result-object v0

    .line 351
    .local v0, "form":Lorg/apache/commons/validator/Form;
    if-eqz v0, :cond_33

    .line 352
    const-string v2, "org.apache.commons.validator.Form"

    invoke-virtual {p0, v2, v0}, Lorg/apache/commons/validator/Validator;->setParameter(Ljava/lang/String;Ljava/lang/Object;)V

    .line 353
    iget-object v2, p0, Lorg/apache/commons/validator/Validator;->parameters:Ljava/util/Map;

    iget-object v3, p0, Lorg/apache/commons/validator/Validator;->resources:Lorg/apache/commons/validator/ValidatorResources;

    invoke-virtual {v3}, Lorg/apache/commons/validator/ValidatorResources;->getValidatorActions()Ljava/util/Map;

    move-result-object v3

    iget v4, p0, Lorg/apache/commons/validator/Validator;->page:I

    iget-object v5, p0, Lorg/apache/commons/validator/Validator;->fieldName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v5}, Lorg/apache/commons/validator/Form;->validate(Ljava/util/Map;Ljava/util/Map;ILjava/lang/String;)Lorg/apache/commons/validator/ValidatorResults;

    move-result-object v2

    .line 360
    :goto_32
    return-object v2

    :cond_33
    new-instance v2, Lorg/apache/commons/validator/ValidatorResults;

    invoke-direct {v2}, Lorg/apache/commons/validator/ValidatorResults;-><init>()V

    goto :goto_32
.end method
