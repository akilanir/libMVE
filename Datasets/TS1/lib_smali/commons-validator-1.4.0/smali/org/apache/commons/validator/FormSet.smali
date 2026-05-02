.class public Lorg/apache/commons/validator/FormSet;
.super Ljava/lang/Object;
.source "FormSet.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field protected static final COUNTRY_FORMSET:I = 0x3

.field protected static final GLOBAL_FORMSET:I = 0x1

.field protected static final LANGUAGE_FORMSET:I = 0x2

.field protected static final VARIANT_FORMSET:I = 0x4

.field static class$org$apache$commons$validator$FormSet:Ljava/lang/Class; = null

.field private static final serialVersionUID:J = -0x7c04df70016f4047L


# instance fields
.field private constants:Ljava/util/Map;

.field private country:Ljava/lang/String;

.field private forms:Ljava/util/Map;

.field private language:Ljava/lang/String;

.field private transient log:Lorg/apache/commons/logging/Log;

.field private merged:Z

.field private processed:Z

.field private variant:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    sget-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    if-nez v0, :cond_2e

    const-string v0, "org.apache.commons.validator.FormSet"

    invoke-static {v0}, Lorg/apache/commons/validator/FormSet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/FormSet;->log:Lorg/apache/commons/logging/Log;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/validator/FormSet;->processed:Z

    .line 50
    iput-object v1, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/FormSet;->constants:Ljava/util/Map;

    return-void

    .line 41
    :cond_2e
    sget-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    goto :goto_10
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 41
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private getLog()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 372
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->log:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_16

    .line 373
    sget-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "org.apache.commons.validator.FormSet"

    invoke-static {v0}, Lorg/apache/commons/validator/FormSet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/FormSet;->log:Lorg/apache/commons/logging/Log;

    .line 375
    :cond_16
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->log:Lorg/apache/commons/logging/Log;

    return-object v0

    .line 373
    :cond_19
    sget-object v0, Lorg/apache/commons/validator/FormSet;->class$org$apache$commons$validator$FormSet:Ljava/lang/Class;

    goto :goto_10
.end method


# virtual methods
.method public addConstant(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->constants:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 243
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSet;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Constant \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' already exists in FormSet["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->displayKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "] - ignoring."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 250
    :goto_36
    return-void

    .line 247
    :cond_37
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->constants:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_36
.end method

.method public addForm(Lorg/apache/commons/validator/Form;)V
    .registers 6
    .param p1, "f"    # Lorg/apache/commons/validator/Form;

    .prologue
    .line 259
    invoke-virtual {p1}, Lorg/apache/commons/validator/Form;->getName()Ljava/lang/String;

    move-result-object v0

    .line 260
    .local v0, "formName":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 261
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSet;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Form \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' already exists in FormSet["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->displayKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "] - ignoring."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 268
    :goto_3a
    return-void

    .line 265
    :cond_3b
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Form;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3a
.end method

.method public displayKey()Ljava/lang/String;
    .registers 3

    .prologue
    .line 310
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 311
    .local v0, "results":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1b

    .line 312
    const-string v1, "language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 313
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 315
    :cond_1b
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    if-eqz v1, :cond_3c

    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3c

    .line 316
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-lez v1, :cond_32

    .line 317
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 319
    :cond_32
    const-string v1, "country="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 320
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 322
    :cond_3c
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    if-eqz v1, :cond_5d

    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5d

    .line 323
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-lez v1, :cond_53

    .line 324
    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 326
    :cond_53
    const-string v1, "variant="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 327
    iget-object v1, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 329
    :cond_5d
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-nez v1, :cond_68

    .line 330
    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 333
    :cond_68
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getCountry()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getForm(Ljava/lang/String;)Lorg/apache/commons/validator/Form;
    .registers 3
    .param p1, "formName"    # Ljava/lang/String;

    .prologue
    .line 277
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Form;

    return-object v0
.end method

.method public getForms()Ljava/util/Map;
    .registers 2

    .prologue
    .line 287
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    return-object v0
.end method

.method protected getType()I
    .registers 3

    .prologue
    .line 119
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getVariant()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1c

    .line 120
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getCountry()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1a

    .line 121
    :cond_12
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "When variant is specified, country and language must be specified."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_1a
    const/4 v0, 0x4

    .line 137
    :goto_1b
    return v0

    .line 126
    :cond_1c
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getCountry()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_32

    .line 127
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_30

    .line 128
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "When country is specified, language must be specified."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_30
    const/4 v0, 0x3

    goto :goto_1b

    .line 133
    :cond_32
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getLanguage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3a

    .line 134
    const/4 v0, 0x2

    goto :goto_1b

    .line 137
    :cond_3a
    const/4 v0, 0x1

    goto :goto_1b
.end method

.method public getVariant()Ljava/lang/String;
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    return-object v0
.end method

.method protected isMerged()Z
    .registers 2

    .prologue
    .line 105
    iget-boolean v0, p0, Lorg/apache/commons/validator/FormSet;->merged:Z

    return v0
.end method

.method public isProcessed()Z
    .registers 2

    .prologue
    .line 177
    iget-boolean v0, p0, Lorg/apache/commons/validator/FormSet;->processed:Z

    return v0
.end method

.method protected merge(Lorg/apache/commons/validator/FormSet;)V
    .registers 9
    .param p1, "depends"    # Lorg/apache/commons/validator/FormSet;

    .prologue
    .line 151
    if-eqz p1, :cond_3e

    .line 152
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getForms()Ljava/util/Map;

    move-result-object v5

    .line 153
    .local v5, "pForms":Ljava/util/Map;
    invoke-virtual {p1}, Lorg/apache/commons/validator/FormSet;->getForms()Ljava/util/Map;

    move-result-object v0

    .line 154
    .local v0, "dForms":Ljava/util/Map;
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 155
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 156
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 157
    .local v3, "key":Ljava/lang/Object;
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/validator/Form;

    .line 158
    .local v4, "pForm":Lorg/apache/commons/validator/Form;
    if-eqz v4, :cond_34

    .line 160
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/validator/Form;

    invoke-virtual {v4, v6}, Lorg/apache/commons/validator/Form;->merge(Lorg/apache/commons/validator/Form;)V

    goto :goto_12

    .line 163
    :cond_34
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/commons/validator/Form;

    invoke-virtual {p0, v6}, Lorg/apache/commons/validator/FormSet;->addForm(Lorg/apache/commons/validator/Form;)V

    goto :goto_12

    .line 167
    .end local v0    # "dForms":Ljava/util/Map;
    .end local v1    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "it":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/lang/Object;
    .end local v4    # "pForm":Lorg/apache/commons/validator/Form;
    .end local v5    # "pForms":Ljava/util/Map;
    :cond_3e
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/apache/commons/validator/FormSet;->merged:Z

    .line 168
    return-void
.end method

.method declared-synchronized process(Ljava/util/Map;)V
    .registers 6
    .param p1, "globalConstants"    # Ljava/util/Map;

    .prologue
    .line 296
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 297
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Form;

    .line 298
    .local v0, "f":Lorg/apache/commons/validator/Form;
    iget-object v2, p0, Lorg/apache/commons/validator/FormSet;->constants:Ljava/util/Map;

    iget-object v3, p0, Lorg/apache/commons/validator/FormSet;->forms:Ljava/util/Map;

    invoke-virtual {v0, p1, v2, v3}, Lorg/apache/commons/validator/Form;->process(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_1f

    goto :goto_b

    .line 296
    .end local v0    # "f":Lorg/apache/commons/validator/Form;
    .end local v1    # "i":Ljava/util/Iterator;
    :catchall_1f
    move-exception v2

    monitor-exit p0

    throw v2

    .line 301
    .restart local v1    # "i":Ljava/util/Iterator;
    :cond_22
    const/4 v2, 0x1

    :try_start_23
    iput-boolean v2, p0, Lorg/apache/commons/validator/FormSet;->processed:Z
    :try_end_25
    .catchall {:try_start_23 .. :try_end_25} :catchall_1f

    .line 302
    monitor-exit p0

    return-void
.end method

.method public setCountry(Ljava/lang/String;)V
    .registers 2
    .param p1, "country"    # Ljava/lang/String;

    .prologue
    .line 213
    iput-object p1, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    .line 214
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 195
    iput-object p1, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    .line 196
    return-void
.end method

.method public setVariant(Ljava/lang/String;)V
    .registers 2
    .param p1, "variant"    # Ljava/lang/String;

    .prologue
    .line 231
    iput-object p1, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    .line 232
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 342
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 344
    .local v1, "results":Ljava/lang/StringBuffer;
    const-string v2, "FormSet: language="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 345
    iget-object v2, p0, Lorg/apache/commons/validator/FormSet;->language:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    const-string v2, "  country="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 347
    iget-object v2, p0, Lorg/apache/commons/validator/FormSet;->country:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 348
    const-string v2, "  variant="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 349
    iget-object v2, p0, Lorg/apache/commons/validator/FormSet;->variant:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 350
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 352
    invoke-virtual {p0}, Lorg/apache/commons/validator/FormSet;->getForms()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    .line 353
    const-string v2, "   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 354
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 355
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_34

    .line 358
    :cond_4c
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
