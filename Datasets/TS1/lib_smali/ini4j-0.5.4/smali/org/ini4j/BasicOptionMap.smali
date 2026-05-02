.class public Lorg/ini4j/BasicOptionMap;
.super Lorg/ini4j/CommonMultiMap;
.source "BasicOptionMap.java"

# interfaces
.implements Lorg/ini4j/OptionMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/BasicOptionMap$Access;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/ini4j/CommonMultiMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;",
        "Lorg/ini4j/OptionMap;"
    }
.end annotation


# static fields
.field private static final ENVIRONMENT_PREFIX:Ljava/lang/String; = "@env/"

.field private static final ENVIRONMENT_PREFIX_LEN:I

.field private static final EXPRESSION:Ljava/util/regex/Pattern;

.field private static final G_INDEX:I = 0x4

.field private static final G_OPTION:I = 0x2

.field private static final SUBST_CHAR:C = '$'

.field private static final SYSTEM_PROPERTY_PREFIX:Ljava/lang/String; = "@prop/"

.field private static final SYSTEM_PROPERTY_PREFIX_LEN:I

.field private static final serialVersionUID:J = 0x4844cfa9a6a3f40L


# instance fields
.field private _defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

.field private final _propertyFirstUpper:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, "@prop/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/ini4j/BasicOptionMap;->SYSTEM_PROPERTY_PREFIX_LEN:I

    .line 33
    const-string v0, "@env/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/ini4j/BasicOptionMap;->ENVIRONMENT_PREFIX_LEN:I

    .line 34
    const-string v0, "(?<!\\\\)\\$\\{(([^\\[\\}]+)(\\[([0-9]+)\\])?)\\}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/ini4j/BasicOptionMap;->EXPRESSION:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/ini4j/BasicOptionMap;-><init>(Z)V

    .line 44
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2
    .param p1, "propertyFirstUpper"    # Z

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/ini4j/CommonMultiMap;-><init>()V

    .line 48
    iput-boolean p1, p0, Lorg/ini4j/BasicOptionMap;->_propertyFirstUpper:Z

    .line 49
    return-void
.end method

.method private requireArray(Ljava/lang/Class;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 280
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_e

    .line 282
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Array required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 284
    :cond_e
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 69
    if-eqz p2, :cond_6

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_c

    :cond_6
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    :goto_8
    invoke-super {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    return-void

    .line 69
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_c
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_8
.end method

.method public add(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "index"    # I

    .prologue
    .line 74
    if-eqz p2, :cond_6

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_c

    :cond_6
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    :goto_8
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/CommonMultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 75
    return-void

    .line 74
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_c
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_8
.end method

.method public as(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 79
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->proxy(Ljava/lang/Class;Lorg/ini4j/spi/BeanAccess;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public as(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p2, "keyPrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->proxy(Ljava/lang/Class;Lorg/ini4j/spi/BeanAccess;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public fetch(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 130
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 118
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 123
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_7

    .end local p3    # "defaultValue":Ljava/lang/Object;, "TT;"
    :goto_6
    return-object p3

    .restart local p3    # "defaultValue":Ljava/lang/Object;, "TT;"
    :cond_7
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_6
.end method

.method public fetch(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v0

    .line 91
    .local v0, "len":I
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, p1, v1}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public fetch(Ljava/lang/Object;I)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 103
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    .local v1, "value":Ljava/lang/String;
    if-eqz v1, :cond_1c

    const/16 v2, 0x24

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1c

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p0, v0}, Lorg/ini4j/BasicOptionMap;->resolve(Ljava/lang/StringBuilder;)V

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 113
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    :cond_1c
    return-object v1
.end method

.method public fetch(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 98
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_9

    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_8
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_9
    move-object p2, v0

    goto :goto_8
.end method

.method public fetchAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 137
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p2}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 140
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 141
    .local v1, "value":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v2

    if-ge v0, v2, :cond_2c

    .line 143
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v2

    invoke-virtual {p0, p1, v0}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v0, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 141
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 146
    :cond_2c
    return-object v1
.end method

.method public from(Ljava/lang/Object;)V
    .registers 4
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 151
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/ini4j/spi/BeanTool;->inject(Lorg/ini4j/spi/BeanAccess;Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method public from(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "keyPrefix"    # Ljava/lang/String;

    .prologue
    .line 156
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/ini4j/spi/BeanTool;->inject(Lorg/ini4j/spi/BeanAccess;Ljava/lang/Object;)V

    .line 157
    return-void
.end method

.method public get(Ljava/lang/Object;ILjava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 180
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v1

    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0, p3}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 161
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v1

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 173
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 175
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_9

    .end local p3    # "defaultValue":Ljava/lang/Object;, "TT;"
    :goto_8
    return-object p3

    .restart local p3    # "defaultValue":Ljava/lang/Object;, "TT;"
    :cond_9
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v1

    invoke-virtual {v1, v0, p2}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    goto :goto_8
.end method

.method public get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 166
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 168
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_9

    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_8
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_9
    move-object p2, v0

    goto :goto_8
.end method

.method public getAll(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 55
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p2}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 58
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 59
    .local v1, "value":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->length(Ljava/lang/Object;)I

    move-result v2

    if-ge v0, v2, :cond_2e

    .line 61
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v3

    invoke-virtual {p0, p1, v0}, Lorg/ini4j/BasicOptionMap;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v0, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 64
    :cond_2e
    return-object v1
.end method

.method declared-synchronized getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;
    .registers 2

    .prologue
    .line 224
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

    if-nez v0, :cond_b

    .line 226
    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->newBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v0

    iput-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;

    .line 229
    :cond_b
    iget-object v0, p0, Lorg/ini4j/BasicOptionMap;->_defaultBeanAccess:Lorg/ini4j/spi/BeanAccess;
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_f

    monitor-exit p0

    return-object v0

    .line 224
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isPropertyFirstUpper()Z
    .registers 2

    .prologue
    .line 234
    iget-boolean v0, p0, Lorg/ini4j/BasicOptionMap;->_propertyFirstUpper:Z

    return v0
.end method

.method newBeanAccess()Lorg/ini4j/spi/BeanAccess;
    .registers 2

    .prologue
    .line 239
    new-instance v0, Lorg/ini4j/BasicOptionMap$Access;

    invoke-direct {v0, p0}, Lorg/ini4j/BasicOptionMap$Access;-><init>(Lorg/ini4j/BasicOptionMap;)V

    return-object v0
.end method

.method newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;
    .registers 3
    .param p1, "propertyNamePrefix"    # Ljava/lang/String;

    .prologue
    .line 244
    new-instance v0, Lorg/ini4j/BasicOptionMap$Access;

    invoke-direct {v0, p0, p1}, Lorg/ini4j/BasicOptionMap$Access;-><init>(Lorg/ini4j/BasicOptionMap;Ljava/lang/String;)V

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 185
    if-eqz p2, :cond_6

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_f

    :cond_6
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    :goto_8
    invoke-super {p0, p1, p2}, Lorg/ini4j/CommonMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .restart local p2    # "value":Ljava/lang/Object;
    :cond_f
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_8
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "index"    # I

    .prologue
    .line 190
    if-eqz p2, :cond_6

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_f

    :cond_6
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    :goto_8
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/CommonMultiMap;->put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .restart local p2    # "value":Ljava/lang/Object;
    :cond_f
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_8
.end method

.method public putAll(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 195
    if-eqz p2, :cond_9

    .line 197
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/ini4j/BasicOptionMap;->requireArray(Ljava/lang/Class;)V

    .line 200
    :cond_9
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicOptionMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    if-eqz p2, :cond_1f

    .line 203
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 205
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    if-ge v0, v1, :cond_1f

    .line 207
    invoke-static {p2, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/ini4j/BasicOptionMap;->add(Ljava/lang/String;Ljava/lang/Object;)V

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 210
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_1f
    return-void
.end method

.method resolve(Ljava/lang/StringBuilder;)V
    .registers 10
    .param p1, "buffer"    # Ljava/lang/StringBuilder;

    .prologue
    const/4 v7, 0x4

    const/4 v4, -0x1

    .line 249
    sget-object v5, Lorg/ini4j/BasicOptionMap;->EXPRESSION:Ljava/util/regex/Pattern;

    invoke-virtual {v5, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 251
    .local v1, "m":Ljava/util/regex/Matcher;
    :cond_8
    :goto_8
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_65

    .line 253
    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_3d

    move v0, v4

    .line 257
    .local v0, "index":I
    :goto_1a
    const-string v5, "@env/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_46

    .line 259
    sget v5, Lorg/ini4j/BasicOptionMap;->ENVIRONMENT_PREFIX_LEN:I

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/ini4j/Config;->getEnvironment(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 270
    .local v3, "value":Ljava/lang/String;
    :goto_2c
    if-eqz v3, :cond_8

    .line 272
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v6

    invoke-virtual {p1, v5, v6, v3}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->reset(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    goto :goto_8

    .line 254
    .end local v0    # "index":I
    .end local v3    # "value":Ljava/lang/String;
    :cond_3d
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_1a

    .line 261
    .restart local v0    # "index":I
    :cond_46
    const-string v5, "@prop/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_59

    .line 263
    sget v5, Lorg/ini4j/BasicOptionMap;->SYSTEM_PROPERTY_PREFIX_LEN:I

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/ini4j/Config;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/String;
    goto :goto_2c

    .line 267
    .end local v3    # "value":Ljava/lang/String;
    :cond_59
    if-ne v0, v4, :cond_60

    invoke-virtual {p0, v2}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/String;
    :goto_5f
    goto :goto_2c

    .end local v3    # "value":Ljava/lang/String;
    :cond_60
    invoke-virtual {p0, v2, v0}, Lorg/ini4j/BasicOptionMap;->fetch(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_5f

    .line 276
    .end local v0    # "index":I
    .end local v2    # "name":Ljava/lang/String;
    :cond_65
    return-void
.end method

.method public to(Ljava/lang/Object;)V
    .registers 4
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 214
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0}, Lorg/ini4j/BasicOptionMap;->getDefaultBeanAccess()Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->inject(Ljava/lang/Object;Lorg/ini4j/spi/BeanAccess;)V

    .line 215
    return-void
.end method

.method public to(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "keyPrefix"    # Ljava/lang/String;

    .prologue
    .line 219
    invoke-static {}, Lorg/ini4j/spi/BeanTool;->getInstance()Lorg/ini4j/spi/BeanTool;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/ini4j/BasicOptionMap;->newBeanAccess(Ljava/lang/String;)Lorg/ini4j/spi/BeanAccess;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lorg/ini4j/spi/BeanTool;->inject(Ljava/lang/Object;Lorg/ini4j/spi/BeanAccess;)V

    .line 220
    return-void
.end method
