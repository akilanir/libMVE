.class Lorg/simpleframework/xml/core/Introspector;
.super Ljava/lang/Object;
.source "Introspector.java"


# instance fields
.field private final contact:Lorg/simpleframework/xml/core/Contact;

.field private final format:Lorg/simpleframework/xml/stream/Format;

.field private final label:Lorg/simpleframework/xml/core/Label;

.field private final marker:Ljava/lang/annotation/Annotation;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/Contact;Lorg/simpleframework/xml/core/Label;Lorg/simpleframework/xml/stream/Format;)V
    .registers 5
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Lorg/simpleframework/xml/core/Label;
    .param p3, "format"    # Lorg/simpleframework/xml/stream/Format;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Contact;->getAnnotation()Ljava/lang/annotation/Annotation;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/Introspector;->marker:Ljava/lang/annotation/Annotation;

    .line 71
    iput-object p1, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    .line 72
    iput-object p3, p0, Lorg/simpleframework/xml/core/Introspector;->format:Lorg/simpleframework/xml/stream/Format;

    .line 73
    iput-object p2, p0, Lorg/simpleframework/xml/core/Introspector;->label:Lorg/simpleframework/xml/core/Label;

    .line 74
    return-void
.end method

.method private getDefault()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v1, p0, Lorg/simpleframework/xml/core/Introspector;->label:Lorg/simpleframework/xml/core/Label;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getOverride()Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/simpleframework/xml/core/Introspector;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 222
    .end local v0    # "name":Ljava/lang/String;
    :goto_c
    return-object v0

    .restart local v0    # "name":Ljava/lang/String;
    :cond_d
    iget-object v1, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Contact;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private getName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/Introspector;->getRoot(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_8

    move-object v1, v0

    .line 138
    :goto_7
    return-object v1

    .line 136
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 138
    invoke-static {v0}, Lorg/simpleframework/xml/core/Reflector;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method private getRoot(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 152
    move-object v1, p1

    .line 154
    .local v1, "real":Ljava/lang/Class;
    :goto_1
    if-eqz p1, :cond_f

    .line 155
    invoke-direct {p0, v1, p1}, Lorg/simpleframework/xml/core/Introspector;->getRoot(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_a

    .line 162
    .end local v0    # "name":Ljava/lang/String;
    :goto_9
    return-object v0

    .line 160
    .restart local v0    # "name":Ljava/lang/String;
    :cond_a
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p1

    .line 161
    goto :goto_1

    .line 162
    .end local v0    # "name":Ljava/lang/String;
    :cond_f
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private getRoot(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "real":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "name":Ljava/lang/String;
    const-class v3, Lorg/simpleframework/xml/Root;

    invoke-virtual {p2, v3}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/Root;

    .line 180
    .local v1, "root":Lorg/simpleframework/xml/Root;
    if-eqz v1, :cond_1e

    .line 181
    invoke-interface {v1}, Lorg/simpleframework/xml/Root;->name()Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "text":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/simpleframework/xml/core/Introspector;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_19

    .line 188
    .end local v2    # "text":Ljava/lang/String;
    :goto_18
    return-object v2

    .line 186
    .restart local v2    # "text":Ljava/lang/String;
    :cond_19
    invoke-static {v0}, Lorg/simpleframework/xml/core/Reflector;->getName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_18

    .line 188
    .end local v2    # "text":Ljava/lang/String;
    :cond_1e
    const/4 v2, 0x0

    goto :goto_18
.end method


# virtual methods
.method public getContact()Lorg/simpleframework/xml/core/Contact;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    return-object v0
.end method

.method public getDependent()Lorg/simpleframework/xml/strategy/Type;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lorg/simpleframework/xml/core/Introspector;->label:Lorg/simpleframework/xml/core/Label;

    invoke-interface {v0}, Lorg/simpleframework/xml/core/Label;->getDependent()Lorg/simpleframework/xml/strategy/Type;

    move-result-object v0

    return-object v0
.end method

.method public getEntry()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/Introspector;->getDependent()Lorg/simpleframework/xml/strategy/Type;

    move-result-object v0

    .line 109
    .local v0, "depend":Lorg/simpleframework/xml/strategy/Type;
    invoke-interface {v0}, Lorg/simpleframework/xml/strategy/Type;->getType()Ljava/lang/Class;

    move-result-object v1

    .line 111
    .local v1, "type":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 112
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 114
    :cond_12
    invoke-direct {p0, v1}, Lorg/simpleframework/xml/core/Introspector;->getName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getExpression()Lorg/simpleframework/xml/core/Expression;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/Introspector;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_10

    .line 237
    new-instance v1, Lorg/simpleframework/xml/core/PathParser;

    iget-object v2, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    iget-object v3, p0, Lorg/simpleframework/xml/core/Introspector;->format:Lorg/simpleframework/xml/stream/Format;

    invoke-direct {v1, v0, v2, v3}, Lorg/simpleframework/xml/core/PathParser;-><init>(Ljava/lang/String;Lorg/simpleframework/xml/strategy/Type;Lorg/simpleframework/xml/stream/Format;)V

    .line 239
    :goto_f
    return-object v1

    :cond_10
    new-instance v1, Lorg/simpleframework/xml/core/EmptyExpression;

    iget-object v2, p0, Lorg/simpleframework/xml/core/Introspector;->format:Lorg/simpleframework/xml/stream/Format;

    invoke-direct {v1, v2}, Lorg/simpleframework/xml/core/EmptyExpression;-><init>(Lorg/simpleframework/xml/stream/Format;)V

    goto :goto_f
.end method

.method public getName()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 200
    iget-object v1, p0, Lorg/simpleframework/xml/core/Introspector;->label:Lorg/simpleframework/xml/core/Label;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getEntry()Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "entry":Ljava/lang/String;
    iget-object v1, p0, Lorg/simpleframework/xml/core/Introspector;->label:Lorg/simpleframework/xml/core/Label;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->isInline()Z

    move-result v1

    if-nez v1, :cond_12

    .line 203
    invoke-direct {p0}, Lorg/simpleframework/xml/core/Introspector;->getDefault()Ljava/lang/String;

    move-result-object v0

    .line 205
    :cond_12
    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 251
    iget-object v1, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    const-class v2, Lorg/simpleframework/xml/Path;

    invoke-interface {v1, v2}, Lorg/simpleframework/xml/core/Contact;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/Path;

    .line 253
    .local v0, "path":Lorg/simpleframework/xml/Path;
    if-nez v0, :cond_e

    .line 254
    const/4 v1, 0x0

    .line 256
    :goto_d
    return-object v1

    :cond_e
    invoke-interface {v0}, Lorg/simpleframework/xml/Path;->value()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public isEmpty(Ljava/lang/String;)Z
    .registers 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 270
    if-eqz p1, :cond_9

    .line 271
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    .line 273
    :cond_9
    :goto_9
    return v0

    .line 271
    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 286
    const-string v0, "%s on %s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/simpleframework/xml/core/Introspector;->marker:Ljava/lang/annotation/Annotation;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lorg/simpleframework/xml/core/Introspector;->contact:Lorg/simpleframework/xml/core/Contact;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
