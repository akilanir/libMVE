.class public Lorg/msgpack/template/builder/beans/FeatureDescriptor;
.super Ljava/lang/Object;
.source "FeatureDescriptor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field displayName:Ljava/lang/String;

.field expert:Z

.field hidden:Z

.field name:Ljava/lang/String;

.field preferred:Z

.field shortDescription:Ljava/lang/String;

.field private values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-class v0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->values:Ljava/util/Map;

    .line 48
    return-void
.end method


# virtual methods
.method public attributeNames()Ljava/util/Enumeration;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Ljava/util/LinkedList;

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->values:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    goto :goto_8
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getShortDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    if-nez v0, :cond_9

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    goto :goto_8
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 77
    if-eqz p1, :cond_9

    .line 78
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isExpert()Z
    .registers 2

    .prologue
    .line 231
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->expert:Z

    return v0
.end method

.method public isHidden()Z
    .registers 2

    .prologue
    .line 220
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->hidden:Z

    return v0
.end method

.method public isPreferred()Z
    .registers 2

    .prologue
    .line 209
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->preferred:Z

    return v0
.end method

.method merge(Lorg/msgpack/template/builder/beans/FeatureDescriptor;)V
    .registers 4
    .param p1, "feature"    # Lorg/msgpack/template/builder/beans/FeatureDescriptor;

    .prologue
    .line 235
    sget-boolean v0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    iget-object v1, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 236
    :cond_14
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->expert:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->expert:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->expert:Z

    .line 237
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->hidden:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->hidden:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->hidden:Z

    .line 238
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->preferred:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->preferred:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->preferred:Z

    .line 239
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    if-nez v0, :cond_31

    .line 240
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    .line 242
    :cond_31
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    if-nez v0, :cond_39

    .line 243
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    .line 245
    :cond_39
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    if-nez v0, :cond_41

    .line 246
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    .line 248
    :cond_41
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->displayName:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setExpert(Z)V
    .registers 2
    .param p1, "expert"    # Z

    .prologue
    .line 198
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->expert:Z

    .line 199
    return-void
.end method

.method public setHidden(Z)V
    .registers 2
    .param p1, "hidden"    # Z

    .prologue
    .line 186
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->hidden:Z

    .line 187
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->name:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public setPreferred(Z)V
    .registers 2
    .param p1, "preferred"    # Z

    .prologue
    .line 174
    iput-boolean p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->preferred:Z

    .line 175
    return-void
.end method

.method public setShortDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->shortDescription:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setValue(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "attributeName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 61
    if-eqz p1, :cond_4

    if-nez p2, :cond_a

    .line 62
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 64
    :cond_a
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/FeatureDescriptor;->values:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    return-void
.end method
