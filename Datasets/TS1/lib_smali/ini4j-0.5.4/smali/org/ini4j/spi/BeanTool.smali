.class public Lorg/ini4j/spi/BeanTool;
.super Ljava/lang/Object;
.source "BeanTool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/spi/BeanTool$BeanInvocationHandler;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lorg/ini4j/spi/BeanTool;

.field private static final PARSE_METHOD:Ljava/lang/String; = "valueOf"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lorg/ini4j/spi/BeanTool;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/BeanTool;

    sput-object v0, Lorg/ini4j/spi/BeanTool;->INSTANCE:Lorg/ini4j/spi/BeanTool;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 313
    return-void
.end method

.method public static final getInstance()Lorg/ini4j/spi/BeanTool;
    .registers 1

    .prologue
    .line 40
    sget-object v0, Lorg/ini4j/spi/BeanTool;->INSTANCE:Lorg/ini4j/spi/BeanTool;

    return-object v0
.end method

.method private getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 258
    :try_start_0
    invoke-static {p1}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;

    move-result-object v1

    invoke-interface {v1}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;
    :try_end_7
    .catch Ljava/beans/IntrospectionException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 260
    :catch_9
    move-exception v0

    .line 262
    .local v0, "x":Ljava/beans/IntrospectionException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private parsePrimitiveValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 268
    const/4 v0, 0x0

    .line 272
    .local v0, "o":Ljava/lang/Object;
    :try_start_1
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_a

    .line 274
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 310
    .end local v0    # "o":Ljava/lang/Object;
    :cond_9
    :goto_9
    return-object v0

    .line 276
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_a
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_13

    .line 278
    invoke-static {p1}, Ljava/lang/Byte;->valueOf(Ljava/lang/String;)Ljava/lang/Byte;

    move-result-object v0

    .local v0, "o":Ljava/lang/Byte;
    goto :goto_9

    .line 280
    .local v0, "o":Ljava/lang/Object;
    :cond_13
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_22

    .line 282
    new-instance v0, Ljava/lang/Character;

    .end local v0    # "o":Ljava/lang/Object;
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Character;-><init>(C)V

    .local v0, "o":Ljava/lang/Character;
    goto :goto_9

    .line 284
    .local v0, "o":Ljava/lang/Object;
    :cond_22
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_2b

    .line 286
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    .local v0, "o":Ljava/lang/Double;
    goto :goto_9

    .line 288
    .local v0, "o":Ljava/lang/Object;
    :cond_2b
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_34

    .line 290
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    .local v0, "o":Ljava/lang/Float;
    goto :goto_9

    .line 292
    .local v0, "o":Ljava/lang/Object;
    :cond_34
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_3d

    .line 294
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .local v0, "o":Ljava/lang/Integer;
    goto :goto_9

    .line 296
    .local v0, "o":Ljava/lang/Object;
    :cond_3d
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_46

    .line 298
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    .local v0, "o":Ljava/lang/Long;
    goto :goto_9

    .line 300
    .local v0, "o":Ljava/lang/Object;
    :cond_46
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_9

    .line 302
    invoke-static {p1}, Ljava/lang/Short;->valueOf(Ljava/lang/String;)Ljava/lang/Short;
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4d} :catch_4f

    move-result-object v0

    .local v0, "o":Ljava/lang/Short;
    goto :goto_9

    .line 305
    .end local v0    # "o":Ljava/lang/Short;
    :catch_4f
    move-exception v1

    .line 307
    .local v1, "x":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2}, Ljava/lang/IllegalArgumentException;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v2

    check-cast v2, Ljava/lang/IllegalArgumentException;

    throw v2
.end method


# virtual methods
.method public inject(Ljava/lang/Object;Lorg/ini4j/spi/BeanAccess;)V
    .registers 15
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "props"    # Lorg/ini4j/spi/BeanAccess;

    .prologue
    .line 45
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/ini4j/spi/BeanTool;->getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .local v0, "arr$":[Ljava/beans/PropertyDescriptor;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_93

    aget-object v6, v0, v2

    .line 49
    .local v6, "pd":Ljava/beans/PropertyDescriptor;
    :try_start_e
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 50
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v5

    .line 52
    .local v5, "name":Ljava/lang/String;
    if-eqz v4, :cond_6a

    invoke-interface {p2, v5}, Lorg/ini4j/spi/BeanAccess;->propLength(Ljava/lang/String;)I

    move-result v9

    if-eqz v9, :cond_6a

    .line 56
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isArray()Z

    move-result v9

    if-eqz v9, :cond_55

    .line 58
    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v9

    invoke-interface {p2, v5}, Lorg/ini4j/spi/BeanAccess;->propLength(Ljava/lang/String;)I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v7

    .line 59
    .local v7, "value":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_39
    invoke-interface {p2, v5}, Lorg/ini4j/spi/BeanAccess;->propLength(Ljava/lang/String;)I

    move-result v9

    if-ge v1, v9, :cond_61

    .line 61
    invoke-interface {p2, v5, v1}, Lorg/ini4j/spi/BeanAccess;->propGet(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, v9, v10}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v7, v1, v9}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    .line 66
    .end local v1    # "i":I
    .end local v7    # "value":Ljava/lang/Object;
    :cond_55
    invoke-interface {p2, v5}, Lorg/ini4j/spi/BeanAccess;->propGet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {p0, v9, v10}, Lorg/ini4j/spi/BeanTool;->parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 69
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_61
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {v4, p1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_6a} :catch_6d

    .line 45
    .end local v7    # "value":Ljava/lang/Object;
    :cond_6a
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 72
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "name":Ljava/lang/String;
    :catch_6d
    move-exception v8

    .line 74
    .local v8, "x":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to set property: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getDisplayName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v8}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v9

    check-cast v9, Ljava/lang/IllegalArgumentException;

    check-cast v9, Ljava/lang/IllegalArgumentException;

    throw v9

    .line 78
    .end local v6    # "pd":Ljava/beans/PropertyDescriptor;
    .end local v8    # "x":Ljava/lang/Exception;
    :cond_93
    return-void
.end method

.method public inject(Lorg/ini4j/spi/BeanAccess;Ljava/lang/Object;)V
    .registers 15
    .param p1, "props"    # Lorg/ini4j/spi/BeanAccess;
    .param p2, "bean"    # Ljava/lang/Object;

    .prologue
    .line 82
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/ini4j/spi/BeanTool;->getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .local v0, "arr$":[Ljava/beans/PropertyDescriptor;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_88

    aget-object v5, v0, v2

    .line 86
    .local v5, "pd":Ljava/beans/PropertyDescriptor;
    :try_start_e
    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 88
    .local v4, "method":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_67

    const-string v9, "class"

    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_67

    .line 90
    const/4 v9, 0x0

    check-cast v9, [Ljava/lang/Object;

    invoke-virtual {v4, p2, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 92
    .local v7, "value":Ljava/lang/Object;
    if-eqz v7, :cond_67

    .line 94
    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->isArray()Z

    move-result v9

    if-eqz v9, :cond_5c

    .line 96
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_34
    invoke-static {v7}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v9

    if-ge v1, v9, :cond_67

    .line 98
    invoke-static {v7, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    .line 100
    .local v6, "v":Ljava/lang/Object;
    if-eqz v6, :cond_50

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-class v10, Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_50

    .line 102
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 105
    .end local v6    # "v":Ljava/lang/Object;
    :cond_50
    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v9

    check-cast v6, Ljava/lang/String;

    invoke-interface {p1, v9, v6}, Lorg/ini4j/spi/BeanAccess;->propAdd(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .line 110
    .end local v1    # "i":I
    :cond_5c
    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {p1, v9, v10}, Lorg/ini4j/spi/BeanAccess;->propSet(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_67} :catch_6a

    .line 82
    .end local v7    # "value":Ljava/lang/Object;
    :cond_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 115
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :catch_6a
    move-exception v8

    .line 117
    .local v8, "x":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to set property: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getDisplayName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 120
    .end local v5    # "pd":Ljava/beans/PropertyDescriptor;
    .end local v8    # "x":Ljava/lang/Exception;
    :cond_88
    return-void
.end method

.method public parse(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 125
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-nez p2, :cond_a

    .line 127
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "null argument"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_a
    const/4 v0, 0x0

    .line 132
    .local v0, "o":Ljava/lang/Object;
    if-nez p1, :cond_12

    .line 134
    invoke-virtual {p0, p2}, Lorg/ini4j/spi/BeanTool;->zero(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 156
    .end local v0    # "o":Ljava/lang/Object;
    :goto_11
    return-object v0

    .line 136
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_12
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 138
    invoke-direct {p0, p1, p2}, Lorg/ini4j/spi/BeanTool;->parsePrimitiveValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_11

    .line 142
    :cond_1d
    const-class v1, Ljava/lang/String;

    if-ne p2, v1, :cond_23

    .line 144
    move-object v0, p1

    .local v0, "o":Ljava/lang/String;
    goto :goto_11

    .line 146
    .local v0, "o":Ljava/lang/Object;
    :cond_23
    const-class v1, Ljava/lang/Character;

    if-ne p2, v1, :cond_32

    .line 148
    new-instance v0, Ljava/lang/Character;

    .end local v0    # "o":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Character;-><init>(C)V

    .local v0, "o":Ljava/lang/Character;
    goto :goto_11

    .line 152
    .local v0, "o":Ljava/lang/Object;
    :cond_32
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/spi/BeanTool;->parseSpecialValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_11
.end method

.method protected parseSpecialValue(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "clazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 216
    :try_start_0
    const-class v3, Ljava/io/File;

    if-ne p2, v3, :cond_a

    .line 218
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 251
    :goto_9
    return-object v0

    .line 220
    :cond_a
    const-class v3, Ljava/net/URL;

    if-ne p2, v3, :cond_14

    .line 222
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .local v0, "o":Ljava/net/URL;
    goto :goto_9

    .line 224
    .end local v0    # "o":Ljava/net/URL;
    :cond_14
    const-class v3, Ljava/net/URI;

    if-ne p2, v3, :cond_1e

    .line 226
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .local v0, "o":Ljava/net/URI;
    goto :goto_9

    .line 228
    .end local v0    # "o":Ljava/net/URI;
    :cond_1e
    const-class v3, Ljava/lang/Class;

    if-ne p2, v3, :cond_27

    .line 230
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .local v0, "o":Ljava/lang/Class;
    goto :goto_9

    .line 232
    .end local v0    # "o":Ljava/lang/Class;
    :cond_27
    const-class v3, Ljava/util/TimeZone;

    if-ne p2, v3, :cond_30

    .line 234
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    .local v0, "o":Ljava/util/TimeZone;
    goto :goto_9

    .line 241
    .end local v0    # "o":Ljava/util/TimeZone;
    :cond_30
    const-string v3, "valueOf"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {p2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 243
    .local v1, "parser":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_48} :catch_4a

    move-result-object v0

    .local v0, "o":Ljava/lang/Object;
    goto :goto_9

    .line 246
    .end local v0    # "o":Ljava/lang/Object;
    .end local v1    # "parser":Ljava/lang/reflect/Method;
    :catch_4a
    move-exception v2

    .line 248
    .local v2, "x":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    check-cast v3, Ljava/lang/IllegalArgumentException;

    throw v3
.end method

.method public proxy(Ljava/lang/Class;Lorg/ini4j/spi/BeanAccess;)Ljava/lang/Object;
    .registers 6
    .param p2, "props"    # Lorg/ini4j/spi/BeanAccess;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lorg/ini4j/spi/BeanAccess;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    new-instance v2, Lorg/ini4j/spi/BeanTool$BeanInvocationHandler;

    invoke-direct {v2, p2}, Lorg/ini4j/spi/BeanTool$BeanInvocationHandler;-><init>(Lorg/ini4j/spi/BeanAccess;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public zero(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
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
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v2, 0x0

    .line 168
    const/4 v0, 0x0

    .line 170
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 172
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_f

    .line 174
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 206
    .end local v0    # "o":Ljava/lang/Object;
    :cond_e
    :goto_e
    return-object v0

    .line 176
    .restart local v0    # "o":Ljava/lang/Object;
    :cond_f
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_18

    .line 178
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    .local v0, "o":Ljava/lang/Byte;
    goto :goto_e

    .line 180
    .local v0, "o":Ljava/lang/Object;
    :cond_18
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_22

    .line 182
    new-instance v0, Ljava/lang/Character;

    .end local v0    # "o":Ljava/lang/Object;
    invoke-direct {v0, v2}, Ljava/lang/Character;-><init>(C)V

    .local v0, "o":Ljava/lang/Character;
    goto :goto_e

    .line 184
    .local v0, "o":Ljava/lang/Object;
    :cond_22
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_2e

    .line 186
    new-instance v0, Ljava/lang/Double;

    .end local v0    # "o":Ljava/lang/Object;
    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    .local v0, "o":Ljava/lang/Double;
    goto :goto_e

    .line 188
    .local v0, "o":Ljava/lang/Object;
    :cond_2e
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_39

    .line 190
    new-instance v0, Ljava/lang/Float;

    .end local v0    # "o":Ljava/lang/Object;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    .local v0, "o":Ljava/lang/Float;
    goto :goto_e

    .line 192
    .local v0, "o":Ljava/lang/Object;
    :cond_39
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_42

    .line 194
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .local v0, "o":Ljava/lang/Integer;
    goto :goto_e

    .line 196
    .local v0, "o":Ljava/lang/Object;
    :cond_42
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_4d

    .line 198
    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .local v0, "o":Ljava/lang/Long;
    goto :goto_e

    .line 200
    .local v0, "o":Ljava/lang/Object;
    :cond_4d
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_e

    .line 202
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    .local v0, "o":Ljava/lang/Short;
    goto :goto_e
.end method
