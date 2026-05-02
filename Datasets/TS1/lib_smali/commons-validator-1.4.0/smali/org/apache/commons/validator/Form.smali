.class public Lorg/apache/commons/validator/Form;
.super Ljava/lang/Object;
.source "Form.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x5971fdf9731c1b93L


# instance fields
.field protected hFields:Lorg/apache/commons/collections/FastHashMap;

.field protected inherit:Ljava/lang/String;

.field protected lFields:Ljava/util/List;

.field protected name:Ljava/lang/String;

.field private processed:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object v1, p0, Lorg/apache/commons/validator/Form;->name:Ljava/lang/String;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    .line 59
    new-instance v0, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    .line 66
    iput-object v1, p0, Lorg/apache/commons/validator/Form;->inherit:Ljava/lang/String;

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/validator/Form;->processed:Z

    return-void
.end method


# virtual methods
.method public addField(Lorg/apache/commons/validator/Field;)V
    .registers 4
    .param p1, "f"    # Lorg/apache/commons/validator/Field;

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {p1}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    return-void
.end method

.method public containsField(Ljava/lang/String;)Z
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getExtends()Ljava/lang/String;
    .registers 2

    .prologue
    .line 316
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->inherit:Ljava/lang/String;

    return-object v0
.end method

.method public getField(Ljava/lang/String;)Lorg/apache/commons/validator/Field;
    .registers 3
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    return-object v0
.end method

.method protected getFieldMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 346
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    return-object v0
.end method

.method public getFields()Ljava/util/List;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isExtending()Z
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lorg/apache/commons/validator/Form;->inherit:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isProcessed()Z
    .registers 2

    .prologue
    .line 306
    iget-boolean v0, p0, Lorg/apache/commons/validator/Form;->processed:Z

    return v0
.end method

.method protected merge(Lorg/apache/commons/validator/Form;)V
    .registers 10
    .param p1, "depends"    # Lorg/apache/commons/validator/Form;

    .prologue
    .line 145
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v5, "templFields":Ljava/util/List;
    new-instance v4, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v4}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    .line 147
    .local v4, "temphFields":Ljava/util/Map;
    invoke-virtual {p1}, Lorg/apache/commons/validator/Form;->getFields()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 148
    .local v1, "dependsIt":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_46

    .line 149
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    .line 150
    .local v0, "defaultField":Lorg/apache/commons/validator/Field;
    if-eqz v0, :cond_12

    .line 151
    invoke-virtual {v0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 152
    .local v2, "fieldKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/Form;->containsField(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_31

    .line 153
    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    invoke-interface {v4, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 157
    :cond_31
    invoke-virtual {p0, v2}, Lorg/apache/commons/validator/Form;->getField(Ljava/lang/String;)Lorg/apache/commons/validator/Field;

    move-result-object v3

    .line 158
    .local v3, "old":Lorg/apache/commons/validator/Field;
    iget-object v6, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v6, v2}, Lorg/apache/commons/collections/FastHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    iget-object v6, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 160
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 165
    .end local v0    # "defaultField":Lorg/apache/commons/validator/Field;
    .end local v2    # "fieldKey":Ljava/lang/String;
    .end local v3    # "old":Lorg/apache/commons/validator/Field;
    :cond_46
    iget-object v6, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    const/4 v7, 0x0

    invoke-interface {v6, v7, v5}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 166
    iget-object v6, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v6, v4}, Lorg/apache/commons/collections/FastHashMap;->putAll(Ljava/util/Map;)V

    .line 167
    return-void
.end method

.method protected process(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .registers 11
    .param p1, "globalConstants"    # Ljava/util/Map;
    .param p2, "constants"    # Ljava/util/Map;
    .param p3, "forms"    # Ljava/util/Map;

    .prologue
    const/4 v6, 0x1

    .line 178
    invoke-virtual {p0}, Lorg/apache/commons/validator/Form;->isProcessed()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 209
    :goto_7
    return-void

    .line 182
    :cond_8
    const/4 v2, 0x0

    .line 183
    .local v2, "n":I
    invoke-virtual {p0}, Lorg/apache/commons/validator/Form;->isExtending()Z

    move-result v4

    if-eqz v4, :cond_53

    .line 184
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->inherit:Ljava/lang/String;

    invoke-interface {p3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/validator/Form;

    .line 185
    .local v3, "parent":Lorg/apache/commons/validator/Form;
    if-eqz v3, :cond_53

    .line 186
    invoke-virtual {v3}, Lorg/apache/commons/validator/Form;->isProcessed()Z

    move-result v4

    if-nez v4, :cond_22

    .line 188
    invoke-virtual {v3, p2, p1, p3}, Lorg/apache/commons/validator/Form;->process(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    .line 190
    :cond_22
    invoke-virtual {v3}, Lorg/apache/commons/validator/Form;->getFields()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_2a
    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_53

    .line 191
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    .line 193
    .local v0, "f":Lorg/apache/commons/validator/Field;
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_2a

    .line 194
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v4, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 195
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v0}, Lorg/apache/commons/validator/Field;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 201
    .end local v0    # "f":Lorg/apache/commons/validator/Field;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v3    # "parent":Lorg/apache/commons/validator/Form;
    :cond_53
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v4, v6}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 203
    iget-object v4, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    .restart local v1    # "i":Ljava/util/Iterator;
    :goto_5e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 204
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    .line 205
    .restart local v0    # "f":Lorg/apache/commons/validator/Field;
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/validator/Field;->process(Ljava/util/Map;Ljava/util/Map;)V

    goto :goto_5e

    .line 208
    .end local v0    # "f":Lorg/apache/commons/validator/Field;
    :cond_6e
    iput-boolean v6, p0, Lorg/apache/commons/validator/Form;->processed:Z

    goto :goto_7
.end method

.method public setExtends(Ljava/lang/String;)V
    .registers 2
    .param p1, "inherit"    # Ljava/lang/String;

    .prologue
    .line 326
    iput-object p1, p0, Lorg/apache/commons/validator/Form;->inherit:Ljava/lang/String;

    .line 327
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/commons/validator/Form;->name:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 217
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 219
    .local v1, "results":Ljava/lang/StringBuffer;
    const-string v2, "Form: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    iget-object v2, p0, Lorg/apache/commons/validator/Form;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 221
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 223
    iget-object v2, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_32

    .line 224
    const-string v2, "\tField: \n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 226
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1a

    .line 229
    :cond_32
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method validate(Ljava/util/Map;Ljava/util/Map;I)Lorg/apache/commons/validator/ValidatorResults;
    .registers 5
    .param p1, "params"    # Ljava/util/Map;
    .param p2, "actions"    # Ljava/util/Map;
    .param p3, "page"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 247
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/Form;->validate(Ljava/util/Map;Ljava/util/Map;ILjava/lang/String;)Lorg/apache/commons/validator/ValidatorResults;

    move-result-object v0

    return-object v0
.end method

.method validate(Ljava/util/Map;Ljava/util/Map;ILjava/lang/String;)Lorg/apache/commons/validator/ValidatorResults;
    .registers 11
    .param p1, "params"    # Ljava/util/Map;
    .param p2, "actions"    # Ljava/util/Map;
    .param p3, "page"    # I
    .param p4, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/ValidatorException;
        }
    .end annotation

    .prologue
    .line 267
    new-instance v2, Lorg/apache/commons/validator/ValidatorResults;

    invoke-direct {v2}, Lorg/apache/commons/validator/ValidatorResults;-><init>()V

    .line 268
    .local v2, "results":Lorg/apache/commons/validator/ValidatorResults;
    const-string v3, "org.apache.commons.validator.ValidatorResults"

    invoke-interface {p1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    if-eqz p4, :cond_50

    .line 272
    iget-object v3, p0, Lorg/apache/commons/validator/Form;->hFields:Lorg/apache/commons/collections/FastHashMap;

    invoke-virtual {v3, p4}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    .line 274
    .local v0, "field":Lorg/apache/commons/validator/Field;
    if-nez v0, :cond_3d

    .line 275
    new-instance v3, Lorg/apache/commons/validator/ValidatorException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unknown field "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " in form "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/commons/validator/Form;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/commons/validator/ValidatorException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 277
    :cond_3d
    const-string v3, "org.apache.commons.validator.Field"

    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    invoke-virtual {v0}, Lorg/apache/commons/validator/Field;->getPage()I

    move-result v3

    if-gt v3, p3, :cond_4f

    .line 280
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/validator/Field;->validate(Ljava/util/Map;Ljava/util/Map;)Lorg/apache/commons/validator/ValidatorResults;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/validator/ValidatorResults;->merge(Lorg/apache/commons/validator/ValidatorResults;)V

    .line 295
    .end local v0    # "field":Lorg/apache/commons/validator/Field;
    :cond_4f
    return-object v2

    .line 283
    :cond_50
    iget-object v3, p0, Lorg/apache/commons/validator/Form;->lFields:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 284
    .local v1, "fields":Ljava/util/Iterator;
    :cond_56
    :goto_56
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 285
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/validator/Field;

    .line 287
    .restart local v0    # "field":Lorg/apache/commons/validator/Field;
    const-string v3, "org.apache.commons.validator.Field"

    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    invoke-virtual {v0}, Lorg/apache/commons/validator/Field;->getPage()I

    move-result v3

    if-gt v3, p3, :cond_56

    .line 290
    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/validator/Field;->validate(Ljava/util/Map;Ljava/util/Map;)Lorg/apache/commons/validator/ValidatorResults;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/commons/validator/ValidatorResults;->merge(Lorg/apache/commons/validator/ValidatorResults;)V

    goto :goto_56
.end method
