.class Lorg/simpleframework/xml/core/LabelExtractor;
.super Ljava/lang/Object;
.source "LabelExtractor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;
    }
.end annotation


# instance fields
.field private final cache:Lorg/simpleframework/xml/util/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/simpleframework/xml/util/Cache",
            "<",
            "Lorg/simpleframework/xml/core/LabelGroup;",
            ">;"
        }
    .end annotation
.end field

.field private final format:Lorg/simpleframework/xml/stream/Format;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/stream/Format;)V
    .registers 3
    .param p1, "format"    # Lorg/simpleframework/xml/stream/Format;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lorg/simpleframework/xml/util/ConcurrentCache;

    invoke-direct {v0}, Lorg/simpleframework/xml/util/ConcurrentCache;-><init>()V

    iput-object v0, p0, Lorg/simpleframework/xml/core/LabelExtractor;->cache:Lorg/simpleframework/xml/util/Cache;

    .line 78
    iput-object p1, p0, Lorg/simpleframework/xml/core/LabelExtractor;->format:Lorg/simpleframework/xml/stream/Format;

    .line 79
    return-void
.end method

.method private getAnnotations(Ljava/lang/annotation/Annotation;)[Ljava/lang/annotation/Annotation;
    .registers 8
    .param p1, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 239
    invoke-interface {p1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v2

    .line 240
    .local v2, "union":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 242
    .local v0, "list":[Ljava/lang/reflect/Method;
    array-length v4, v0

    if-lez v4, :cond_19

    .line 243
    aget-object v1, v0, v5

    .line 244
    .local v1, "method":Ljava/lang/reflect/Method;
    new-array v4, v5, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 246
    .local v3, "value":Ljava/lang/Object;
    check-cast v3, [Ljava/lang/annotation/Annotation;

    .end local v3    # "value":Ljava/lang/Object;
    check-cast v3, [Ljava/lang/annotation/Annotation;

    .line 248
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_18
    return-object v3

    :cond_19
    new-array v3, v5, [Ljava/lang/annotation/Annotation;

    goto :goto_18
.end method

.method private getBuilder(Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;
    .registers 6
    .param p1, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 319
    instance-of v0, p1, Lorg/simpleframework/xml/Element;

    if-eqz v0, :cond_e

    .line 320
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementLabel;

    const-class v2, Lorg/simpleframework/xml/Element;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    .line 347
    :goto_d
    return-object v0

    .line 322
    :cond_e
    instance-of v0, p1, Lorg/simpleframework/xml/ElementList;

    if-eqz v0, :cond_1c

    .line 323
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementListLabel;

    const-class v2, Lorg/simpleframework/xml/ElementList;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 325
    :cond_1c
    instance-of v0, p1, Lorg/simpleframework/xml/ElementArray;

    if-eqz v0, :cond_2a

    .line 326
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementArrayLabel;

    const-class v2, Lorg/simpleframework/xml/ElementArray;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 328
    :cond_2a
    instance-of v0, p1, Lorg/simpleframework/xml/ElementMap;

    if-eqz v0, :cond_38

    .line 329
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementMapLabel;

    const-class v2, Lorg/simpleframework/xml/ElementMap;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 331
    :cond_38
    instance-of v0, p1, Lorg/simpleframework/xml/ElementUnion;

    if-eqz v0, :cond_48

    .line 332
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementUnionLabel;

    const-class v2, Lorg/simpleframework/xml/ElementUnion;

    const-class v3, Lorg/simpleframework/xml/Element;

    invoke-direct {v0, v1, v2, v3}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 334
    :cond_48
    instance-of v0, p1, Lorg/simpleframework/xml/ElementListUnion;

    if-eqz v0, :cond_58

    .line 335
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementListUnionLabel;

    const-class v2, Lorg/simpleframework/xml/ElementListUnion;

    const-class v3, Lorg/simpleframework/xml/ElementList;

    invoke-direct {v0, v1, v2, v3}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 337
    :cond_58
    instance-of v0, p1, Lorg/simpleframework/xml/ElementMapUnion;

    if-eqz v0, :cond_68

    .line 338
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/ElementMapUnionLabel;

    const-class v2, Lorg/simpleframework/xml/ElementMapUnion;

    const-class v3, Lorg/simpleframework/xml/ElementMap;

    invoke-direct {v0, v1, v2, v3}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 340
    :cond_68
    instance-of v0, p1, Lorg/simpleframework/xml/Attribute;

    if-eqz v0, :cond_76

    .line 341
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/AttributeLabel;

    const-class v2, Lorg/simpleframework/xml/Attribute;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 343
    :cond_76
    instance-of v0, p1, Lorg/simpleframework/xml/Version;

    if-eqz v0, :cond_84

    .line 344
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/VersionLabel;

    const-class v2, Lorg/simpleframework/xml/Version;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto :goto_d

    .line 346
    :cond_84
    instance-of v0, p1, Lorg/simpleframework/xml/Text;

    if-eqz v0, :cond_93

    .line 347
    new-instance v0, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    const-class v1, Lorg/simpleframework/xml/core/TextLabel;

    const-class v2, Lorg/simpleframework/xml/Text;

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    goto/16 :goto_d

    .line 349
    :cond_93
    new-instance v0, Lorg/simpleframework/xml/core/PersistenceException;

    const-string v1, "Annotation %s not supported"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-direct {v0, v1, v2}, Lorg/simpleframework/xml/core/PersistenceException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0
.end method

.method private getConstructor(Ljava/lang/annotation/Annotation;)Ljava/lang/reflect/Constructor;
    .registers 5
    .param p1, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 299
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/LabelExtractor;->getBuilder(Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;

    move-result-object v0

    .line 300
    .local v0, "builder":Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;
    invoke-virtual {v0}, Lorg/simpleframework/xml/core/LabelExtractor$LabelBuilder;->getConstructor()Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 302
    .local v1, "factory":Ljava/lang/reflect/Constructor;
    invoke-virtual {v1}, Ljava/lang/reflect/Constructor;->isAccessible()Z

    move-result v2

    if-nez v2, :cond_12

    .line 303
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 305
    :cond_12
    return-object v1
.end method

.method private getGroup(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/Object;)Lorg/simpleframework/xml/core/LabelGroup;
    .registers 7
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .param p3, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 139
    iget-object v2, p0, Lorg/simpleframework/xml/core/LabelExtractor;->cache:Lorg/simpleframework/xml/util/Cache;

    invoke-interface {v2, p3}, Lorg/simpleframework/xml/util/Cache;->fetch(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/LabelGroup;

    .line 141
    .local v1, "value":Lorg/simpleframework/xml/core/LabelGroup;
    if-nez v1, :cond_16

    .line 142
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getLabels(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v0

    .line 144
    .local v0, "list":Lorg/simpleframework/xml/core/LabelGroup;
    if-eqz v0, :cond_15

    .line 145
    iget-object v2, p0, Lorg/simpleframework/xml/core/LabelExtractor;->cache:Lorg/simpleframework/xml/util/Cache;

    invoke-interface {v2, p3, v0}, Lorg/simpleframework/xml/util/Cache;->cache(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    .end local v0    # "list":Lorg/simpleframework/xml/core/LabelGroup;
    :cond_15
    :goto_15
    return-object v0

    :cond_16
    move-object v0, v1

    goto :goto_15
.end method

.method private getKey(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Ljava/lang/Object;
    .registers 4
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;

    .prologue
    .line 285
    new-instance v0, Lorg/simpleframework/xml/core/LabelKey;

    invoke-direct {v0, p1, p2}, Lorg/simpleframework/xml/core/LabelKey;-><init>(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V

    return-object v0
.end method

.method private getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;
    .registers 10
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .param p3, "entry"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 265
    invoke-direct {p0, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getConstructor(Ljava/lang/annotation/Annotation;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 267
    .local v0, "factory":Ljava/lang/reflect/Constructor;
    if-eqz p3, :cond_1e

    .line 268
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v2

    aput-object p2, v1, v3

    aput-object p3, v1, v4

    iget-object v2, p0, Lorg/simpleframework/xml/core/LabelExtractor;->format:Lorg/simpleframework/xml/stream/Format;

    aput-object v2, v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    .line 270
    :goto_1d
    return-object v1

    :cond_1e
    new-array v1, v5, [Ljava/lang/Object;

    aput-object p1, v1, v2

    aput-object p2, v1, v3

    iget-object v2, p0, Lorg/simpleframework/xml/core/LabelExtractor;->format:Lorg/simpleframework/xml/stream/Format;

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    goto :goto_1d
.end method

.method private getLabels(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;
    .registers 4
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 165
    instance-of v0, p2, Lorg/simpleframework/xml/ElementUnion;

    if-eqz v0, :cond_9

    .line 166
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getUnion(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v0

    .line 174
    :goto_8
    return-object v0

    .line 168
    :cond_9
    instance-of v0, p2, Lorg/simpleframework/xml/ElementListUnion;

    if-eqz v0, :cond_12

    .line 169
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getUnion(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v0

    goto :goto_8

    .line 171
    :cond_12
    instance-of v0, p2, Lorg/simpleframework/xml/ElementMapUnion;

    if-eqz v0, :cond_1b

    .line 172
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getUnion(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v0

    goto :goto_8

    .line 174
    :cond_1b
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getSingle(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v0

    goto :goto_8
.end method

.method private getSingle(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;
    .registers 6
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 190
    const/4 v2, 0x0

    invoke-direct {p0, p1, p2, v2}, Lorg/simpleframework/xml/core/LabelExtractor;->getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;

    move-result-object v0

    .line 192
    .local v0, "value":Lorg/simpleframework/xml/core/Label;
    if-eqz v0, :cond_d

    .line 193
    new-instance v1, Lorg/simpleframework/xml/core/CacheLabel;

    invoke-direct {v1, v0}, Lorg/simpleframework/xml/core/CacheLabel;-><init>(Lorg/simpleframework/xml/core/Label;)V

    .end local v0    # "value":Lorg/simpleframework/xml/core/Label;
    .local v1, "value":Lorg/simpleframework/xml/core/Label;
    move-object v0, v1

    .line 195
    .end local v1    # "value":Lorg/simpleframework/xml/core/Label;
    .restart local v0    # "value":Lorg/simpleframework/xml/core/Label;
    :cond_d
    new-instance v2, Lorg/simpleframework/xml/core/LabelGroup;

    invoke-direct {v2, v0}, Lorg/simpleframework/xml/core/LabelGroup;-><init>(Lorg/simpleframework/xml/core/Label;)V

    return-object v2
.end method

.method private getUnion(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/LabelGroup;
    .registers 12
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 211
    invoke-direct {p0, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getAnnotations(Ljava/lang/annotation/Annotation;)[Ljava/lang/annotation/Annotation;

    move-result-object v6

    .line 213
    .local v6, "list":[Ljava/lang/annotation/Annotation;
    array-length v8, v6

    if-lez v8, :cond_2b

    .line 214
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 216
    .local v4, "labels":Ljava/util/List;, "Ljava/util/List<Lorg/simpleframework/xml/core/Label;>;"
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_f
    if-ge v3, v5, :cond_25

    aget-object v7, v0, v3

    .line 217
    .local v7, "value":Ljava/lang/annotation/Annotation;
    invoke-direct {p0, p1, p2, v7}, Lorg/simpleframework/xml/core/LabelExtractor;->getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;

    move-result-object v1

    .line 219
    .local v1, "entry":Lorg/simpleframework/xml/core/Label;
    if-eqz v1, :cond_1f

    .line 220
    new-instance v2, Lorg/simpleframework/xml/core/CacheLabel;

    invoke-direct {v2, v1}, Lorg/simpleframework/xml/core/CacheLabel;-><init>(Lorg/simpleframework/xml/core/Label;)V

    .end local v1    # "entry":Lorg/simpleframework/xml/core/Label;
    .local v2, "entry":Lorg/simpleframework/xml/core/Label;
    move-object v1, v2

    .line 222
    .end local v2    # "entry":Lorg/simpleframework/xml/core/Label;
    .restart local v1    # "entry":Lorg/simpleframework/xml/core/Label;
    :cond_1f
    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 224
    .end local v1    # "entry":Lorg/simpleframework/xml/core/Label;
    .end local v7    # "value":Ljava/lang/annotation/Annotation;
    :cond_25
    new-instance v8, Lorg/simpleframework/xml/core/LabelGroup;

    invoke-direct {v8, v4}, Lorg/simpleframework/xml/core/LabelGroup;-><init>(Ljava/util/List;)V

    .line 226
    .end local v0    # "arr$":[Ljava/lang/annotation/Annotation;
    .end local v3    # "i$":I
    .end local v4    # "labels":Ljava/util/List;, "Ljava/util/List<Lorg/simpleframework/xml/core/Label;>;"
    .end local v5    # "len$":I
    :goto_2a
    return-object v8

    :cond_2b
    const/4 v8, 0x0

    goto :goto_2a
.end method


# virtual methods
.method public getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;
    .registers 6
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getKey(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Ljava/lang/Object;

    move-result-object v0

    .line 95
    .local v0, "key":Ljava/lang/Object;
    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/LabelExtractor;->getGroup(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/Object;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v1

    .line 97
    .local v1, "list":Lorg/simpleframework/xml/core/LabelGroup;
    if-eqz v1, :cond_f

    .line 98
    invoke-virtual {v1}, Lorg/simpleframework/xml/core/LabelGroup;->getPrimary()Lorg/simpleframework/xml/core/Label;

    move-result-object v2

    .line 100
    :goto_e
    return-object v2

    :cond_f
    const/4 v2, 0x0

    goto :goto_e
.end method

.method public getList(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Ljava/util/List;
    .registers 6
    .param p1, "contact"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/simpleframework/xml/core/Contact;",
            "Ljava/lang/annotation/Annotation;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/simpleframework/xml/core/Label;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 116
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/LabelExtractor;->getKey(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Ljava/lang/Object;

    move-result-object v0

    .line 117
    .local v0, "key":Ljava/lang/Object;
    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/LabelExtractor;->getGroup(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Ljava/lang/Object;)Lorg/simpleframework/xml/core/LabelGroup;

    move-result-object v1

    .line 119
    .local v1, "list":Lorg/simpleframework/xml/core/LabelGroup;
    if-eqz v1, :cond_f

    .line 120
    invoke-virtual {v1}, Lorg/simpleframework/xml/core/LabelGroup;->getList()Ljava/util/List;

    move-result-object v2

    .line 122
    :goto_e
    return-object v2

    :cond_f
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_e
.end method
