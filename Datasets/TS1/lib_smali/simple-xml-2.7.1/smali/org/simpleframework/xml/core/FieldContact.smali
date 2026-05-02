.class Lorg/simpleframework/xml/core/FieldContact;
.super Ljava/lang/Object;
.source "FieldContact.java"

# interfaces
.implements Lorg/simpleframework/xml/core/Contact;


# instance fields
.field private final cache:Lorg/simpleframework/xml/util/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/simpleframework/xml/util/Cache",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation
.end field

.field private final field:Ljava/lang/reflect/Field;

.field private final label:Ljava/lang/annotation/Annotation;

.field private final list:[Ljava/lang/annotation/Annotation;

.field private final modifier:I

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Field;Ljava/lang/annotation/Annotation;[Ljava/lang/annotation/Annotation;)V
    .registers 5
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .param p3, "list"    # [Ljava/lang/annotation/Annotation;

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Lorg/simpleframework/xml/util/ConcurrentCache;

    invoke-direct {v0}, Lorg/simpleframework/xml/util/ConcurrentCache;-><init>()V

    iput-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->cache:Lorg/simpleframework/xml/util/Cache;

    .line 81
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    iput v0, p0, Lorg/simpleframework/xml/core/FieldContact;->modifier:I

    .line 82
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->name:Ljava/lang/String;

    .line 83
    iput-object p2, p0, Lorg/simpleframework/xml/core/FieldContact;->label:Ljava/lang/annotation/Annotation;

    .line 84
    iput-object p1, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    .line 85
    iput-object p3, p0, Lorg/simpleframework/xml/core/FieldContact;->list:[Ljava/lang/annotation/Annotation;

    .line 86
    return-void
.end method

.method private getCache(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v5, p0, Lorg/simpleframework/xml/core/FieldContact;->cache:Lorg/simpleframework/xml/util/Cache;

    invoke-interface {v5}, Lorg/simpleframework/xml/util/Cache;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 219
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->list:[Ljava/lang/annotation/Annotation;

    .local v0, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_c
    if-ge v2, v4, :cond_1c

    aget-object v1, v0, v2

    .line 220
    .local v1, "entry":Ljava/lang/annotation/Annotation;
    invoke-interface {v1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v3

    .line 221
    .local v3, "key":Ljava/lang/Class;
    iget-object v5, p0, Lorg/simpleframework/xml/core/FieldContact;->cache:Lorg/simpleframework/xml/util/Cache;

    invoke-interface {v5, v3, v1}, Lorg/simpleframework/xml/util/Cache;->cache(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 219
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 224
    .end local v0    # "arr$":[Ljava/lang/annotation/Annotation;
    .end local v1    # "entry":Ljava/lang/annotation/Annotation;
    .end local v2    # "i$":I
    .end local v3    # "key":Ljava/lang/Class;
    .end local v4    # "len$":I
    :cond_1c
    iget-object v5, p0, Lorg/simpleframework/xml/core/FieldContact;->cache:Lorg/simpleframework/xml/util/Cache;

    invoke-interface {v5, p1}, Lorg/simpleframework/xml/util/Cache;->fetch(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/annotation/Annotation;

    return-object v5
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "source"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 252
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotation()Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->label:Ljava/lang/annotation/Annotation;

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 202
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->label:Ljava/lang/annotation/Annotation;

    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v0

    if-ne p1, v0, :cond_b

    .line 203
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->label:Ljava/lang/annotation/Annotation;

    .line 205
    :goto_a
    return-object v0

    :cond_b
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/FieldContact;->getCache(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    goto :goto_a
.end method

.method public getDeclaringClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getDependent()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-static {v0}, Lorg/simpleframework/xml/core/Reflector;->getDependent(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getDependents()[Ljava/lang/Class;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-static {v0}, Lorg/simpleframework/xml/core/Reflector;->getDependents(Ljava/lang/reflect/Field;)[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 178
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public isFinal()Z
    .registers 2

    .prologue
    .line 120
    iget v0, p0, Lorg/simpleframework/xml/core/FieldContact;->modifier:I

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    return v0
.end method

.method public isReadOnly()Z
    .registers 2

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/FieldContact;->isStatic()Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lorg/simpleframework/xml/core/FieldContact;->isFinal()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isStatic()Z
    .registers 2

    .prologue
    .line 109
    iget v0, p0, Lorg/simpleframework/xml/core/FieldContact;->modifier:I

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    return v0
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 236
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/FieldContact;->isFinal()Z

    move-result v0

    if-nez v0, :cond_b

    .line 237
    iget-object v0, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 239
    :cond_b
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 264
    const-string v0, "field \'%s\' %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/simpleframework/xml/core/FieldContact;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/simpleframework/xml/core/FieldContact;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
