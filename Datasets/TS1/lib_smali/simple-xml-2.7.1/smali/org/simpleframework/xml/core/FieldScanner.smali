.class Lorg/simpleframework/xml/core/FieldScanner;
.super Lorg/simpleframework/xml/core/ContactList;
.source "FieldScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/simpleframework/xml/core/FieldScanner$FieldKey;
    }
.end annotation


# instance fields
.field private final done:Lorg/simpleframework/xml/core/ContactMap;

.field private final factory:Lorg/simpleframework/xml/core/AnnotationFactory;

.field private final support:Lorg/simpleframework/xml/core/Support;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/core/Support;)V
    .registers 4
    .param p1, "detail"    # Lorg/simpleframework/xml/core/Detail;
    .param p2, "support"    # Lorg/simpleframework/xml/core/Support;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/simpleframework/xml/core/ContactList;-><init>()V

    .line 77
    new-instance v0, Lorg/simpleframework/xml/core/AnnotationFactory;

    invoke-direct {v0, p1, p2}, Lorg/simpleframework/xml/core/AnnotationFactory;-><init>(Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/core/Support;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/FieldScanner;->factory:Lorg/simpleframework/xml/core/AnnotationFactory;

    .line 78
    new-instance v0, Lorg/simpleframework/xml/core/ContactMap;

    invoke-direct {v0}, Lorg/simpleframework/xml/core/ContactMap;-><init>()V

    iput-object v0, p0, Lorg/simpleframework/xml/core/FieldScanner;->done:Lorg/simpleframework/xml/core/ContactMap;

    .line 79
    iput-object p2, p0, Lorg/simpleframework/xml/core/FieldScanner;->support:Lorg/simpleframework/xml/core/Support;

    .line 80
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/FieldScanner;->scan(Lorg/simpleframework/xml/core/Detail;)V

    .line 81
    return-void
.end method

.method private build()V
    .registers 4

    .prologue
    .line 310
    iget-object v2, p0, Lorg/simpleframework/xml/core/FieldScanner;->done:Lorg/simpleframework/xml/core/ContactMap;

    invoke-virtual {v2}, Lorg/simpleframework/xml/core/ContactMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/core/Contact;

    .line 311
    .local v0, "contact":Lorg/simpleframework/xml/core/Contact;
    invoke-virtual {p0, v0}, Lorg/simpleframework/xml/core/FieldScanner;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 313
    .end local v0    # "contact":Lorg/simpleframework/xml/core/Contact;
    :cond_16
    return-void
.end method

.method private extend(Ljava/lang/Class;Lorg/simpleframework/xml/DefaultType;)V
    .registers 5
    .param p1, "base"    # Ljava/lang/Class;
    .param p2, "access"    # Lorg/simpleframework/xml/DefaultType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 114
    iget-object v1, p0, Lorg/simpleframework/xml/core/FieldScanner;->support:Lorg/simpleframework/xml/core/Support;

    invoke-virtual {v1, p1, p2}, Lorg/simpleframework/xml/core/Support;->getFields(Ljava/lang/Class;Lorg/simpleframework/xml/DefaultType;)Lorg/simpleframework/xml/core/ContactList;

    move-result-object v0

    .line 116
    .local v0, "list":Lorg/simpleframework/xml/core/ContactList;
    if-eqz v0, :cond_b

    .line 117
    invoke-virtual {p0, v0}, Lorg/simpleframework/xml/core/FieldScanner;->addAll(Ljava/util/Collection;)Z

    .line 119
    :cond_b
    return-void
.end method

.method private extract(Lorg/simpleframework/xml/core/Detail;)V
    .registers 12
    .param p1, "detail"    # Lorg/simpleframework/xml/core/Detail;

    .prologue
    .line 130
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Detail;->getFields()Ljava/util/List;

    move-result-object v3

    .line 132
    .local v3, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/simpleframework/xml/core/FieldDetail;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_29

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/FieldDetail;

    .line 133
    .local v1, "entry":Lorg/simpleframework/xml/core/FieldDetail;
    invoke-virtual {v1}, Lorg/simpleframework/xml/core/FieldDetail;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v8

    .line 134
    .local v8, "list":[Ljava/lang/annotation/Annotation;
    invoke-virtual {v1}, Lorg/simpleframework/xml/core/FieldDetail;->getField()Ljava/lang/reflect/Field;

    move-result-object v2

    .line 136
    .local v2, "field":Ljava/lang/reflect/Field;
    move-object v0, v8

    .local v0, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1f
    if-ge v5, v7, :cond_8

    aget-object v6, v0, v5

    .line 137
    .local v6, "label":Ljava/lang/annotation/Annotation;
    invoke-direct {p0, v2, v6, v8}, Lorg/simpleframework/xml/core/FieldScanner;->scan(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 136
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 140
    .end local v0    # "arr$":[Ljava/lang/annotation/Annotation;
    .end local v1    # "entry":Lorg/simpleframework/xml/core/FieldDetail;
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "label":Ljava/lang/annotation/Annotation;
    .end local v7    # "len$":I
    .end local v8    # "list":[Ljava/lang/annotation/Annotation;
    :cond_29
    return-void
.end method

.method private extract(Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/DefaultType;)V
    .registers 10
    .param p1, "detail"    # Lorg/simpleframework/xml/core/Detail;
    .param p2, "access"    # Lorg/simpleframework/xml/DefaultType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 152
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Detail;->getFields()Ljava/util/List;

    move-result-object v2

    .line 154
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/simpleframework/xml/core/FieldDetail;>;"
    sget-object v6, Lorg/simpleframework/xml/DefaultType;->FIELD:Lorg/simpleframework/xml/DefaultType;

    if-ne p2, v6, :cond_34

    .line 155
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_c
    :goto_c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_34

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/core/FieldDetail;

    .line 156
    .local v0, "entry":Lorg/simpleframework/xml/core/FieldDetail;
    invoke-virtual {v0}, Lorg/simpleframework/xml/core/FieldDetail;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v4

    .line 157
    .local v4, "list":[Ljava/lang/annotation/Annotation;
    invoke-virtual {v0}, Lorg/simpleframework/xml/core/FieldDetail;->getField()Ljava/lang/reflect/Field;

    move-result-object v1

    .line 158
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    .line 160
    .local v5, "real":Ljava/lang/Class;
    invoke-direct {p0, v1}, Lorg/simpleframework/xml/core/FieldScanner;->isStatic(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-nez v6, :cond_c

    invoke-direct {p0, v1}, Lorg/simpleframework/xml/core/FieldScanner;->isTransient(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-nez v6, :cond_c

    .line 161
    invoke-direct {p0, v1, v5, v4}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/Class;[Ljava/lang/annotation/Annotation;)V

    goto :goto_c

    .line 165
    .end local v0    # "entry":Lorg/simpleframework/xml/core/FieldDetail;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "list":[Ljava/lang/annotation/Annotation;
    .end local v5    # "real":Ljava/lang/Class;
    :cond_34
    return-void
.end method

.method private insert(Ljava/lang/Object;Lorg/simpleframework/xml/core/Contact;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "contact"    # Lorg/simpleframework/xml/core/Contact;

    .prologue
    .line 262
    iget-object v1, p0, Lorg/simpleframework/xml/core/FieldScanner;->done:Lorg/simpleframework/xml/core/ContactMap;

    invoke-virtual {v1, p1}, Lorg/simpleframework/xml/core/ContactMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/core/Contact;

    .line 264
    .local v0, "existing":Lorg/simpleframework/xml/core/Contact;
    if-eqz v0, :cond_11

    .line 265
    invoke-direct {p0, p2}, Lorg/simpleframework/xml/core/FieldScanner;->isText(Lorg/simpleframework/xml/core/Contact;)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 266
    move-object p2, v0

    .line 269
    :cond_11
    iget-object v1, p0, Lorg/simpleframework/xml/core/FieldScanner;->done:Lorg/simpleframework/xml/core/ContactMap;

    invoke-virtual {v1, p1, p2}, Lorg/simpleframework/xml/core/ContactMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    return-void
.end method

.method private isStatic(Ljava/lang/reflect/Field;)Z
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 325
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    .line 327
    .local v0, "modifier":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 328
    const/4 v1, 0x1

    .line 330
    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method private isText(Lorg/simpleframework/xml/core/Contact;)Z
    .registers 4
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;

    .prologue
    .line 282
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Contact;->getAnnotation()Ljava/lang/annotation/Annotation;

    move-result-object v0

    .line 284
    .local v0, "label":Ljava/lang/annotation/Annotation;
    instance-of v1, v0, Lorg/simpleframework/xml/Text;

    if-eqz v1, :cond_a

    .line 285
    const/4 v1, 0x1

    .line 287
    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private isTransient(Ljava/lang/reflect/Field;)Z
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 344
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    .line 346
    .local v0, "modifier":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 347
    const/4 v1, 0x1

    .line 349
    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method private process(Ljava/lang/reflect/Field;Ljava/lang/Class;[Ljava/lang/annotation/Annotation;)V
    .registers 7
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "type"    # Ljava/lang/Class;
    .param p3, "list"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 224
    invoke-static {p1}, Lorg/simpleframework/xml/core/Reflector;->getDependents(Ljava/lang/reflect/Field;)[Ljava/lang/Class;

    move-result-object v0

    .line 225
    .local v0, "dependents":[Ljava/lang/Class;
    iget-object v2, p0, Lorg/simpleframework/xml/core/FieldScanner;->factory:Lorg/simpleframework/xml/core/AnnotationFactory;

    invoke-virtual {v2, p2, v0}, Lorg/simpleframework/xml/core/AnnotationFactory;->getInstance(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    .line 227
    .local v1, "label":Ljava/lang/annotation/Annotation;
    if-eqz v1, :cond_f

    .line 228
    invoke-direct {p0, p1, v1, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 230
    :cond_f
    return-void
.end method

.method private process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V
    .registers 7
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .param p3, "list"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 243
    new-instance v0, Lorg/simpleframework/xml/core/FieldContact;

    invoke-direct {v0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldContact;-><init>(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 244
    .local v0, "contact":Lorg/simpleframework/xml/core/Contact;
    new-instance v1, Lorg/simpleframework/xml/core/FieldScanner$FieldKey;

    invoke-direct {v1, p1}, Lorg/simpleframework/xml/core/FieldScanner$FieldKey;-><init>(Ljava/lang/reflect/Field;)V

    .line 246
    .local v1, "key":Lorg/simpleframework/xml/core/FieldScanner$FieldKey;
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v2

    if-nez v2, :cond_14

    .line 247
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 249
    :cond_14
    invoke-direct {p0, v1, v0}, Lorg/simpleframework/xml/core/FieldScanner;->insert(Ljava/lang/Object;Lorg/simpleframework/xml/core/Contact;)V

    .line 250
    return-void
.end method

.method private remove(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;)V
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;

    .prologue
    .line 300
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldScanner;->done:Lorg/simpleframework/xml/core/ContactMap;

    new-instance v1, Lorg/simpleframework/xml/core/FieldScanner$FieldKey;

    invoke-direct {v1, p1}, Lorg/simpleframework/xml/core/FieldScanner$FieldKey;-><init>(Ljava/lang/reflect/Field;)V

    invoke-virtual {v0, v1}, Lorg/simpleframework/xml/core/ContactMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    return-void
.end method

.method private scan(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .param p3, "list"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 178
    instance-of v0, p2, Lorg/simpleframework/xml/Attribute;

    if-eqz v0, :cond_7

    .line 179
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 181
    :cond_7
    instance-of v0, p2, Lorg/simpleframework/xml/ElementUnion;

    if-eqz v0, :cond_e

    .line 182
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 184
    :cond_e
    instance-of v0, p2, Lorg/simpleframework/xml/ElementListUnion;

    if-eqz v0, :cond_15

    .line 185
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 187
    :cond_15
    instance-of v0, p2, Lorg/simpleframework/xml/ElementMapUnion;

    if-eqz v0, :cond_1c

    .line 188
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 190
    :cond_1c
    instance-of v0, p2, Lorg/simpleframework/xml/ElementList;

    if-eqz v0, :cond_23

    .line 191
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 193
    :cond_23
    instance-of v0, p2, Lorg/simpleframework/xml/ElementArray;

    if-eqz v0, :cond_2a

    .line 194
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 196
    :cond_2a
    instance-of v0, p2, Lorg/simpleframework/xml/ElementMap;

    if-eqz v0, :cond_31

    .line 197
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 199
    :cond_31
    instance-of v0, p2, Lorg/simpleframework/xml/Element;

    if-eqz v0, :cond_38

    .line 200
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 202
    :cond_38
    instance-of v0, p2, Lorg/simpleframework/xml/Version;

    if-eqz v0, :cond_3f

    .line 203
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 205
    :cond_3f
    instance-of v0, p2, Lorg/simpleframework/xml/Text;

    if-eqz v0, :cond_46

    .line 206
    invoke-direct {p0, p1, p2, p3}, Lorg/simpleframework/xml/core/FieldScanner;->process(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V

    .line 208
    :cond_46
    instance-of v0, p2, Lorg/simpleframework/xml/Transient;

    if-eqz v0, :cond_4d

    .line 209
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/FieldScanner;->remove(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;)V

    .line 211
    :cond_4d
    return-void
.end method

.method private scan(Lorg/simpleframework/xml/core/Detail;)V
    .registers 5
    .param p1, "detail"    # Lorg/simpleframework/xml/core/Detail;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 92
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Detail;->getOverride()Lorg/simpleframework/xml/DefaultType;

    move-result-object v2

    .line 93
    .local v2, "override":Lorg/simpleframework/xml/DefaultType;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Detail;->getAccess()Lorg/simpleframework/xml/DefaultType;

    move-result-object v0

    .line 94
    .local v0, "access":Lorg/simpleframework/xml/DefaultType;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Detail;->getSuper()Ljava/lang/Class;

    move-result-object v1

    .line 96
    .local v1, "base":Ljava/lang/Class;
    if-eqz v1, :cond_11

    .line 97
    invoke-direct {p0, v1, v2}, Lorg/simpleframework/xml/core/FieldScanner;->extend(Ljava/lang/Class;Lorg/simpleframework/xml/DefaultType;)V

    .line 99
    :cond_11
    invoke-direct {p0, p1, v0}, Lorg/simpleframework/xml/core/FieldScanner;->extract(Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/DefaultType;)V

    .line 100
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/FieldScanner;->extract(Lorg/simpleframework/xml/core/Detail;)V

    .line 101
    invoke-direct {p0}, Lorg/simpleframework/xml/core/FieldScanner;->build()V

    .line 102
    return-void
.end method
