.class public Lorg/apache/commons/beanutils/BeanUtilsBean;
.super Ljava/lang/Object;
.source "BeanUtilsBean.java"


# static fields
.field private static final BEANS_BY_CLASSLOADER:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

.field private static final INIT_CAUSE_METHOD:Ljava/lang/reflect/Method;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$Throwable:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;


# instance fields
.field private convertUtilsBean:Lorg/apache/commons/beanutils/ConvertUtilsBean;

.field private log:Lorg/apache/commons/logging/Log;

.field private propertyUtilsBean:Lorg/apache/commons/beanutils/PropertyUtilsBean;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 65
    new-instance v0, Lorg/apache/commons/beanutils/BeanUtilsBean$1;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/BeanUtilsBean$1;-><init>()V

    sput-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->BEANS_BY_CLASSLOADER:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

    .line 108
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInitCauseMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->INIT_CAUSE_METHOD:Ljava/lang/reflect/Method;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 117
    new-instance v0, Lorg/apache/commons/beanutils/ConvertUtilsBean;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;-><init>()V

    new-instance v1, Lorg/apache/commons/beanutils/PropertyUtilsBean;

    invoke-direct {v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;-><init>()V

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/beanutils/BeanUtilsBean;-><init>(Lorg/apache/commons/beanutils/ConvertUtilsBean;Lorg/apache/commons/beanutils/PropertyUtilsBean;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/ConvertUtilsBean;)V
    .registers 3
    .param p1, "convertUtilsBean"    # Lorg/apache/commons/beanutils/ConvertUtilsBean;

    .prologue
    .line 130
    new-instance v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;-><init>()V

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/BeanUtilsBean;-><init>(Lorg/apache/commons/beanutils/ConvertUtilsBean;Lorg/apache/commons/beanutils/PropertyUtilsBean;)V

    .line 131
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/ConvertUtilsBean;Lorg/apache/commons/beanutils/PropertyUtilsBean;)V
    .registers 4
    .param p1, "convertUtilsBean"    # Lorg/apache/commons/beanutils/ConvertUtilsBean;
    .param p2, "propertyUtilsBean"    # Lorg/apache/commons/beanutils/PropertyUtilsBean;

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    sget-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    if-nez v0, :cond_1a

    const-string v0, "org.apache.commons.beanutils.BeanUtils"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    .line 145
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->convertUtilsBean:Lorg/apache/commons/beanutils/ConvertUtilsBean;

    .line 146
    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->propertyUtilsBean:Lorg/apache/commons/beanutils/PropertyUtilsBean;

    .line 147
    return-void

    .line 99
    :cond_1a
    sget-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    goto :goto_f
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 99
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

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getInitCauseMethod()Ljava/lang/reflect/Method;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 1095
    const/4 v3, 0x1

    :try_start_2
    new-array v2, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v3, :cond_26

    const-string v3, "java.lang.Throwable"

    invoke-static {v3}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_11
    aput-object v3, v2, v5

    .line 1096
    .local v2, "paramsClasses":[Ljava/lang/Class;
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v3, :cond_29

    const-string v3, "java.lang.Throwable"

    invoke-static {v3}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_1f
    const-string v5, "initCause"

    invoke-virtual {v3, v5, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1108
    :goto_25
    return-object v3

    .line 1095
    .end local v2    # "paramsClasses":[Ljava/lang/Class;
    :cond_26
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;

    goto :goto_11

    .line 1096
    .restart local v2    # "paramsClasses":[Ljava/lang/Class;
    :cond_29
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Throwable:Ljava/lang/Class;
    :try_end_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2b} :catch_2c
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2b} :catch_4d

    goto :goto_1f

    .line 1097
    :catch_2c
    move-exception v0

    .line 1098
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    if-nez v3, :cond_4a

    const-string v3, "org.apache.commons.beanutils.BeanUtils"

    invoke-static {v3}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    :goto_39
    invoke-static {v3}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 1099
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v3

    if-eqz v3, :cond_48

    .line 1100
    const-string v3, "Throwable does not have initCause() method in JDK 1.3"

    invoke-interface {v1, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    :cond_48
    move-object v3, v4

    .line 1102
    goto :goto_25

    .line 1098
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_4a
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    goto :goto_39

    .line 1103
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_4d
    move-exception v0

    .line 1104
    .local v0, "e":Ljava/lang/Throwable;
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    if-nez v3, :cond_6b

    const-string v3, "org.apache.commons.beanutils.BeanUtils"

    invoke-static {v3}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    :goto_5a
    invoke-static {v3}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 1105
    .restart local v1    # "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v3

    if-eqz v3, :cond_69

    .line 1106
    const-string v3, "Error getting the Throwable initCause() method"

    invoke-interface {v1, v3, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :cond_69
    move-object v3, v4

    .line 1108
    goto :goto_25

    .line 1104
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_6b
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$org$apache$commons$beanutils$BeanUtils:Ljava/lang/Class;

    goto :goto_5a
.end method

.method public static getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->BEANS_BY_CLASSLOADER:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/BeanUtilsBean;

    return-object v0
.end method

.method public static setInstance(Lorg/apache/commons/beanutils/BeanUtilsBean;)V
    .registers 2
    .param p0, "newInstance"    # Lorg/apache/commons/beanutils/BeanUtilsBean;

    .prologue
    .line 91
    sget-object v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->BEANS_BY_CLASSLOADER:Lorg/apache/commons/beanutils/ContextClassLoaderLocal;

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ContextClassLoaderLocal;->set(Ljava/lang/Object;)V

    .line 92
    return-void
.end method


# virtual methods
.method public cloneBean(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 177
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 178
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cloning bean: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 180
    :cond_28
    const/4 v0, 0x0

    .line 181
    .local v0, "newBean":Ljava/lang/Object;
    instance-of v1, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v1, :cond_40

    move-object v1, p1

    .line 182
    check-cast v1, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/beanutils/DynaClass;->newInstance()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 186
    .end local v0    # "newBean":Ljava/lang/Object;
    :goto_38
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->copyProperties(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 187
    return-object v0

    .line 184
    .restart local v0    # "newBean":Ljava/lang/Object;
    :cond_40
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    goto :goto_38
.end method

.method protected convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 1075
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    .line 1076
    .local v0, "converter":Lorg/apache/commons/beanutils/Converter;
    if-eqz v0, :cond_26

    .line 1077
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "        USING CONVERTER "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 1078
    invoke-interface {v0, p2, p1}, Lorg/apache/commons/beanutils/Converter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 1080
    .end local p1    # "value":Ljava/lang/Object;
    :cond_26
    return-object p1
.end method

.method public copyProperties(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 12
    .param p1, "dest"    # Ljava/lang/Object;
    .param p2, "orig"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 238
    if-nez p1, :cond_a

    .line 239
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No destination bean specified"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 242
    :cond_a
    if-nez p2, :cond_14

    .line 243
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No origin bean specified"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    :cond_14
    iget-object v6, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_44

    .line 246
    iget-object v6, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "BeanUtils.copyProperties("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 251
    :cond_44
    instance-of v6, p2, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v6, :cond_7e

    move-object v6, p2

    .line 252
    check-cast v6, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v6}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v4

    .line 254
    .local v4, "origDescriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_54
    array-length v6, v4

    if-ge v2, v6, :cond_ef

    .line 255
    aget-object v6, v4, v2

    invoke-virtual {v6}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v3

    .line 258
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p2, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isReadable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7b

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7b

    move-object v6, p2

    .line 260
    check-cast v6, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v6, v3}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 261
    .local v5, "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, v3, v5}, Lorg/apache/commons/beanutils/BeanUtilsBean;->copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 254
    .end local v5    # "value":Ljava/lang/Object;
    :cond_7b
    add-int/lit8 v2, v2, 0x1

    goto :goto_54

    .line 264
    .end local v2    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "origDescriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    :cond_7e
    instance-of v6, p2, Ljava/util/Map;

    if-eqz v6, :cond_b0

    .line 265
    check-cast p2, Ljava/util/Map;

    .end local p2    # "orig":Ljava/lang/Object;
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 266
    .local v0, "entries":Ljava/util/Iterator;
    :cond_8c
    :goto_8c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ef

    .line 267
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 268
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 269
    .restart local v3    # "name":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8c

    .line 270
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, p1, v3, v6}, Lorg/apache/commons/beanutils/BeanUtilsBean;->copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_8c

    .line 274
    .end local v0    # "entries":Ljava/util/Iterator;
    .end local v1    # "entry":Ljava/util/Map$Entry;
    .end local v3    # "name":Ljava/lang/String;
    .restart local p2    # "orig":Ljava/lang/Object;
    :cond_b0
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;

    move-result-object v4

    .line 276
    .local v4, "origDescriptors":[Ljava/beans/PropertyDescriptor;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_b9
    array-length v6, v4

    if-ge v2, v6, :cond_ef

    .line 277
    aget-object v6, v4, v2

    invoke-virtual {v6}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    .line 278
    .restart local v3    # "name":Ljava/lang/String;
    const-string v6, "class"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_cd

    .line 276
    :cond_ca
    :goto_ca
    add-int/lit8 v2, v2, 0x1

    goto :goto_b9

    .line 281
    :cond_cd
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p2, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isReadable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ca

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_ca

    .line 284
    :try_start_e1
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v6

    invoke-virtual {v6, p2, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 286
    .restart local v5    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1, v3, v5}, Lorg/apache/commons/beanutils/BeanUtilsBean;->copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_ec
    .catch Ljava/lang/NoSuchMethodException; {:try_start_e1 .. :try_end_ec} :catch_ed

    goto :goto_ca

    .line 287
    .end local v5    # "value":Ljava/lang/Object;
    :catch_ed
    move-exception v6

    goto :goto_ca

    .line 294
    .end local v2    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "origDescriptors":[Ljava/beans/PropertyDescriptor;
    .end local p2    # "orig":Ljava/lang/Object;
    :cond_ef
    return-void
.end method

.method public copyProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 22
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 332
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v15}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v15

    if-eqz v15, :cond_3c

    .line 333
    new-instance v11, Ljava/lang/StringBuffer;

    const-string v15, "  copyProperty("

    invoke-direct {v11, v15}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 334
    .local v11, "sb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p1

    invoke-virtual {v11, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 335
    const-string v15, ", "

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 336
    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 337
    const-string v15, ", "

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 338
    if-nez p3, :cond_65

    .line 339
    const-string v15, "<NULL>"

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 355
    :goto_2c
    const/16 v15, 0x29

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 356
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 360
    .end local v11    # "sb":Ljava/lang/StringBuffer;
    :cond_3c
    move-object/from16 v12, p1

    .line 361
    .local v12, "target":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    invoke-virtual {v15}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getResolver()Lorg/apache/commons/beanutils/expression/Resolver;

    move-result-object v10

    .line 362
    .local v10, "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    :goto_46
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_a8

    .line 364
    :try_start_4e
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v15, v12, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 365
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;
    :try_end_63
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4e .. :try_end_63} :catch_a6

    move-result-object p2

    goto :goto_46

    .line 340
    .end local v10    # "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    .end local v12    # "target":Ljava/lang/Object;
    .restart local v11    # "sb":Ljava/lang/StringBuffer;
    :cond_65
    move-object/from16 v0, p3

    instance-of v15, v0, Ljava/lang/String;

    if-eqz v15, :cond_73

    move-object/from16 v15, p3

    .line 341
    check-cast v15, Ljava/lang/String;

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 342
    :cond_73
    move-object/from16 v0, p3

    instance-of v15, v0, [Ljava/lang/String;

    if-eqz v15, :cond_9e

    move-object/from16 v15, p3

    .line 343
    check-cast v15, [Ljava/lang/String;

    move-object v14, v15

    check-cast v14, [Ljava/lang/String;

    .line 344
    .local v14, "values":[Ljava/lang/String;
    const/16 v15, 0x5b

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 345
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_86
    array-length v15, v14

    if-ge v6, v15, :cond_98

    .line 346
    if-lez v6, :cond_90

    .line 347
    const/16 v15, 0x2c

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 349
    :cond_90
    aget-object v15, v14, v6

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 345
    add-int/lit8 v6, v6, 0x1

    goto :goto_86

    .line 351
    :cond_98
    const/16 v15, 0x5d

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 353
    .end local v6    # "i":I
    .end local v14    # "values":[Ljava/lang/String;
    :cond_9e
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v11, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2c

    .line 366
    .end local v11    # "sb":Ljava/lang/StringBuffer;
    .restart local v10    # "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    .restart local v12    # "target":Ljava/lang/Object;
    :catch_a6
    move-exception v5

    .line 446
    :cond_a7
    :goto_a7
    return-void

    .line 370
    :cond_a8
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v15}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v15

    if-eqz v15, :cond_ec

    .line 371
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "    Target bean = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 372
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "    Target name = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 376
    :cond_ec
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 377
    .local v9, "propName":Ljava/lang/String;
    const/4 v13, 0x0

    .line 378
    .local v13, "type":Ljava/lang/Class;
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getIndex(Ljava/lang/String;)I

    move-result v7

    .line 379
    .local v7, "index":I
    move-object/from16 v0, p2

    invoke-interface {v10, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 382
    .local v8, "key":Ljava/lang/String;
    instance-of v15, v12, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v15, :cond_195

    move-object v15, v12

    .line 383
    check-cast v15, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v15}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v3

    .line 384
    .local v3, "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    invoke-interface {v3, v9}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v4

    .line 385
    .local v4, "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    if-eqz v4, :cond_a7

    .line 388
    invoke-virtual {v4}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v13

    .line 410
    .end local v3    # "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    .end local v4    # "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_114
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v15}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v15

    if-eqz v15, :cond_15e

    .line 411
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "    target propName="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string v17, ", type="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string v17, ", index="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string v17, ", key="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 416
    :cond_15e
    if-ltz v7, :cond_1d9

    .line 417
    invoke-virtual {v13}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v15

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/BeanUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    .line 419
    :try_start_16c
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v12, v9, v7, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V
    :try_end_175
    .catch Ljava/lang/NoSuchMethodException; {:try_start_16c .. :try_end_175} :catch_177

    goto/16 :goto_a7

    .line 421
    :catch_177
    move-exception v5

    .line 422
    .local v5, "e":Ljava/lang/NoSuchMethodException;
    new-instance v15, Ljava/lang/reflect/InvocationTargetException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Cannot set "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v5, v0}, Ljava/lang/reflect/InvocationTargetException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v15

    .line 390
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :cond_195
    const/4 v2, 0x0

    .line 392
    .local v2, "descriptor":Ljava/beans/PropertyDescriptor;
    :try_start_196
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v12, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;
    :try_end_19f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_196 .. :try_end_19f} :catch_1d6

    move-result-object v2

    .line 394
    if-eqz v2, :cond_a7

    .line 400
    invoke-virtual {v2}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v13

    .line 401
    if-nez v13, :cond_114

    .line 403
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v15}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v15

    if-eqz v15, :cond_a7

    .line 404
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "    target type for property \'"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-string v17, "\' is null, so skipping ths setter"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    goto/16 :goto_a7

    .line 397
    :catch_1d6
    move-exception v5

    .line 398
    .restart local v5    # "e":Ljava/lang/NoSuchMethodException;
    goto/16 :goto_a7

    .line 425
    .end local v2    # "descriptor":Ljava/beans/PropertyDescriptor;
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :cond_1d9
    if-eqz v8, :cond_204

    .line 430
    :try_start_1db
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v12, v9, v8, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1e4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1db .. :try_end_1e4} :catch_1e6

    goto/16 :goto_a7

    .line 432
    :catch_1e6
    move-exception v5

    .line 433
    .restart local v5    # "e":Ljava/lang/NoSuchMethodException;
    new-instance v15, Ljava/lang/reflect/InvocationTargetException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Cannot set "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v5, v0}, Ljava/lang/reflect/InvocationTargetException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v15

    .line 437
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :cond_204
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v13}, Lorg/apache/commons/beanutils/BeanUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p3

    .line 439
    :try_start_20c
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v12, v9, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_215
    .catch Ljava/lang/NoSuchMethodException; {:try_start_20c .. :try_end_215} :catch_217

    goto/16 :goto_a7

    .line 440
    :catch_217
    move-exception v5

    .line 441
    .restart local v5    # "e":Ljava/lang/NoSuchMethodException;
    new-instance v15, Ljava/lang/reflect/InvocationTargetException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string v17, "Cannot set "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v5, v0}, Ljava/lang/reflect/InvocationTargetException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v15
.end method

.method public describe(Ljava/lang/Object;)Ljava/util/Map;
    .registers 10
    .param p1, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 490
    if-nez p1, :cond_8

    .line 492
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 518
    :cond_7
    return-object v1

    .line 495
    :cond_8
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v5

    if-eqz v5, :cond_30

    .line 496
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Describing bean: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 499
    :cond_30
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 500
    .local v1, "description":Ljava/util/Map;
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_58

    move-object v5, p1

    .line 501
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    .line 503
    .local v2, "descriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_45
    array-length v5, v2

    if-ge v3, v5, :cond_7

    .line 504
    aget-object v5, v2, v3

    invoke-virtual {v5}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v4

    .line 505
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v4}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 503
    add-int/lit8 v3, v3, 0x1

    goto :goto_45

    .line 508
    .end local v2    # "descriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    .end local v3    # "i":I
    .end local v4    # "name":Ljava/lang/String;
    :cond_58
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v5

    invoke-virtual {v5, p1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;

    move-result-object v2

    .line 510
    .local v2, "descriptors":[Ljava/beans/PropertyDescriptor;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 511
    .local v0, "clazz":Ljava/lang/Class;
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_65
    array-length v5, v2

    if-ge v3, v5, :cond_7

    .line 512
    aget-object v5, v2, v3

    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v4

    .line 513
    .restart local v4    # "name":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v5

    aget-object v6, v2, v3

    invoke-virtual {v5, v0, v6}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v5

    if-eqz v5, :cond_81

    .line 514
    invoke-virtual {p0, p1, v4}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 511
    :cond_81
    add-int/lit8 v3, v3, 0x1

    goto :goto_65
.end method

.method public getArrayProperty(Ljava/lang/Object;Ljava/lang/String;)[Ljava/lang/String;
    .registers 12
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 542
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v7

    invoke-virtual {v7, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 543
    .local v5, "value":Ljava/lang/Object;
    if-nez v5, :cond_d

    move-object v4, v8

    .line 574
    .end local v5    # "value":Ljava/lang/Object;
    :cond_c
    :goto_c
    return-object v4

    .line 545
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_d
    instance-of v7, v5, Ljava/util/Collection;

    if-eqz v7, :cond_4b

    .line 546
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 547
    .local v6, "values":Ljava/util/ArrayList;
    check-cast v5, Ljava/util/Collection;

    .end local v5    # "value":Ljava/lang/Object;
    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 548
    .local v2, "items":Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3b

    .line 549
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 550
    .local v1, "item":Ljava/lang/Object;
    if-nez v1, :cond_2f

    move-object v7, v8

    .line 551
    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 554
    :cond_2f
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v7

    invoke-virtual {v7, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 557
    .end local v1    # "item":Ljava/lang/Object;
    :cond_3b
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    check-cast v7, [Ljava/lang/String;

    move-object v4, v7

    goto :goto_c

    .line 558
    .end local v2    # "items":Ljava/util/Iterator;
    .end local v6    # "values":Ljava/util/ArrayList;
    .restart local v5    # "value":Ljava/lang/Object;
    :cond_4b
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_74

    .line 559
    invoke-static {v5}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v3

    .line 560
    .local v3, "n":I
    new-array v4, v3, [Ljava/lang/String;

    .line 561
    .local v4, "results":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5c
    if-ge v0, v3, :cond_c

    .line 562
    invoke-static {v5, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 563
    .restart local v1    # "item":Ljava/lang/Object;
    if-nez v1, :cond_69

    .line 564
    aput-object v8, v4, v0

    .line 561
    :goto_66
    add-int/lit8 v0, v0, 0x1

    goto :goto_5c

    .line 567
    :cond_69
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v7

    invoke-virtual {v7, v1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v0

    goto :goto_66

    .line 572
    .end local v0    # "i":I
    .end local v1    # "item":Ljava/lang/Object;
    .end local v3    # "n":I
    .end local v4    # "results":[Ljava/lang/String;
    :cond_74
    const/4 v7, 0x1

    new-array v4, v7, [Ljava/lang/String;

    .line 573
    .restart local v4    # "results":[Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v8

    invoke-virtual {v8, v5}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    goto :goto_c
.end method

.method public getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;
    .registers 2

    .prologue
    .line 1031
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->convertUtilsBean:Lorg/apache/commons/beanutils/ConvertUtilsBean;

    return-object v0
.end method

.method public getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 603
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 604
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/String;
    .registers 6
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 631
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    .line 632
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 660
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 661
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 688
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 689
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 715
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 716
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 741
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;
    .registers 2

    .prologue
    .line 1040
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->propertyUtilsBean:Lorg/apache/commons/beanutils/PropertyUtilsBean;

    return-object v0
.end method

.method public getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 765
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 766
    .local v0, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z
    .registers 9
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1052
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->INIT_CAUSE_METHOD:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_17

    if-eqz p2, :cond_17

    .line 1054
    :try_start_8
    sget-object v3, Lorg/apache/commons/beanutils/BeanUtilsBean;->INIT_CAUSE_METHOD:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_13} :catch_14

    .line 1060
    :goto_13
    return v1

    .line 1056
    :catch_14
    move-exception v0

    .local v0, "e":Ljava/lang/Throwable;
    move v1, v2

    .line 1057
    goto :goto_13

    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_17
    move v1, v2

    .line 1060
    goto :goto_13
.end method

.method public populate(Ljava/lang/Object;Ljava/util/Map;)V
    .registers 9
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "properties"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 810
    if-eqz p1, :cond_4

    if-nez p2, :cond_5

    .line 834
    :cond_4
    return-void

    .line 813
    :cond_5
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 814
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "BeanUtils.populate("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 819
    :cond_35
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 820
    .local v0, "entries":Ljava/util/Iterator;
    :cond_3d
    :goto_3d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 823
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 824
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 825
    .local v2, "name":Ljava/lang/String;
    if-eqz v2, :cond_3d

    .line 830
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, p1, v2, v3}, Lorg/apache/commons/beanutils/BeanUtilsBean;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3d
.end method

.method public setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 24
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 871
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v17

    if-eqz v17, :cond_4a

    .line 872
    new-instance v13, Ljava/lang/StringBuffer;

    const-string v17, "  setProperty("

    move-object/from16 v0, v17

    invoke-direct {v13, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 873
    .local v13, "sb":Ljava/lang/StringBuffer;
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 874
    const-string v17, ", "

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 875
    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 876
    const-string v17, ", "

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 877
    if-nez p3, :cond_75

    .line 878
    const-string v17, "<NULL>"

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 894
    :goto_36
    const/16 v17, 0x29

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 895
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 899
    .end local v13    # "sb":Ljava/lang/StringBuffer;
    :cond_4a
    move-object/from16 v14, p1

    .line 900
    .local v14, "target":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getResolver()Lorg/apache/commons/beanutils/expression/Resolver;

    move-result-object v12

    .line 901
    .local v12, "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    :goto_54
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_d1

    .line 903
    :try_start_5c
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v17

    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v14, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 904
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;
    :try_end_73
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5c .. :try_end_73} :catch_cf

    move-result-object p2

    goto :goto_54

    .line 879
    .end local v12    # "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    .end local v14    # "target":Ljava/lang/Object;
    .restart local v13    # "sb":Ljava/lang/StringBuffer;
    :cond_75
    move-object/from16 v0, p3

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_87

    move-object/from16 v17, p3

    .line 880
    check-cast v17, Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_36

    .line 881
    :cond_87
    move-object/from16 v0, p3

    instance-of v0, v0, [Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_c4

    move-object/from16 v17, p3

    .line 882
    check-cast v17, [Ljava/lang/String;

    move-object/from16 v16, v17

    check-cast v16, [Ljava/lang/String;

    .line 883
    .local v16, "values":[Ljava/lang/String;
    const/16 v17, 0x5b

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 884
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_9f
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v7, v0, :cond_bb

    .line 885
    if-lez v7, :cond_b1

    .line 886
    const/16 v17, 0x2c

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 888
    :cond_b1
    aget-object v17, v16, v7

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 884
    add-int/lit8 v7, v7, 0x1

    goto :goto_9f

    .line 890
    :cond_bb
    const/16 v17, 0x5d

    move/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_36

    .line 892
    .end local v7    # "i":I
    .end local v16    # "values":[Ljava/lang/String;
    :cond_c4
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto/16 :goto_36

    .line 905
    .end local v13    # "sb":Ljava/lang/StringBuffer;
    .restart local v12    # "resolver":Lorg/apache/commons/beanutils/expression/Resolver;
    .restart local v14    # "target":Ljava/lang/Object;
    :catch_cf
    move-exception v6

    .line 1023
    .end local p3    # "value":Ljava/lang/Object;
    :cond_d0
    :goto_d0
    return-void

    .line 909
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_d1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v17

    if-eqz v17, :cond_11b

    .line 910
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "    Target bean = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 911
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "    Target name = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 915
    :cond_11b
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 916
    .local v11, "propName":Ljava/lang/String;
    const/4 v15, 0x0

    .line 917
    .local v15, "type":Ljava/lang/Class;
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getIndex(Ljava/lang/String;)I

    move-result v8

    .line 918
    .local v8, "index":I
    move-object/from16 v0, p2

    invoke-interface {v12, v0}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 921
    .local v9, "key":Ljava/lang/String;
    instance-of v0, v14, Lorg/apache/commons/beanutils/DynaBean;

    move/from16 v17, v0

    if-eqz v17, :cond_198

    move-object/from16 v17, v14

    .line 922
    check-cast v17, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    .line 923
    .local v4, "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    invoke-interface {v4, v11}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v5

    .line 924
    .local v5, "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    if-eqz v5, :cond_d0

    .line 927
    invoke-virtual {v5}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v15

    .line 981
    .end local v4    # "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    .end local v5    # "dynaProperty":Lorg/apache/commons/beanutils/DynaProperty;
    :goto_146
    const/4 v10, 0x0

    .line 982
    .local v10, "newValue":Ljava/lang/Object;
    invoke-virtual {v15}, Ljava/lang/Class;->isArray()Z

    move-result v17

    if-eqz v17, :cond_2d3

    if-gez v8, :cond_2d3

    .line 983
    if-nez p3, :cond_299

    .line 984
    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 985
    .restart local v16    # "values":[Ljava/lang/String;
    const/16 v17, 0x0

    const/16 v18, 0x0

    aput-object v18, v16, v17

    .line 986
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    .line 1017
    .end local v16    # "values":[Ljava/lang/String;
    .end local p3    # "value":Ljava/lang/Object;
    :goto_16b
    :try_start_16b
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v14, v1, v10}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_176
    .catch Ljava/lang/NoSuchMethodException; {:try_start_16b .. :try_end_176} :catch_178

    goto/16 :goto_d0

    .line 1018
    :catch_178
    move-exception v6

    .line 1019
    .local v6, "e":Ljava/lang/NoSuchMethodException;
    new-instance v17, Ljava/lang/reflect/InvocationTargetException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "Cannot set "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v0, v6, v1}, Ljava/lang/reflect/InvocationTargetException;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    throw v17

    .line 928
    .end local v6    # "e":Ljava/lang/NoSuchMethodException;
    .end local v10    # "newValue":Ljava/lang/Object;
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_198
    instance-of v0, v14, Ljava/util/Map;

    move/from16 v17, v0

    if-eqz v17, :cond_1ae

    .line 929
    sget-object v17, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v17, :cond_1ab

    const-string v17, "java.lang.Object"

    invoke-static/range {v17 .. v17}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    .end local v15    # "type":Ljava/lang/Class;
    sput-object v15, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    .restart local v15    # "type":Ljava/lang/Class;
    :goto_1aa
    goto :goto_146

    :cond_1ab
    sget-object v15, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1aa

    .line 930
    :cond_1ae
    if-eqz v14, :cond_1c5

    invoke-virtual {v14}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->isArray()Z

    move-result v17

    if-eqz v17, :cond_1c5

    if-ltz v8, :cond_1c5

    .line 931
    invoke-static {v14, v8}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    goto :goto_146

    .line 933
    :cond_1c5
    const/4 v3, 0x0

    .line 935
    .local v3, "descriptor":Ljava/beans/PropertyDescriptor;
    :try_start_1c6
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v14, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;
    :try_end_1d1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1c6 .. :try_end_1d1} :catch_1fd

    move-result-object v3

    .line 937
    if-eqz v3, :cond_d0

    .line 943
    instance-of v0, v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    move/from16 v17, v0

    if-eqz v17, :cond_208

    move-object/from16 v17, v3

    .line 944
    check-cast v17, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    invoke-virtual/range {v17 .. v17}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v17

    if-nez v17, :cond_200

    .line 945
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 946
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Skipping read-only property"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_d0

    .line 940
    :catch_1fd
    move-exception v6

    .line 941
    .restart local v6    # "e":Ljava/lang/NoSuchMethodException;
    goto/16 :goto_d0

    .line 950
    .end local v6    # "e":Ljava/lang/NoSuchMethodException;
    :cond_200
    check-cast v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v3    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v3}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedPropertyType()Ljava/lang/Class;

    move-result-object v15

    goto/16 :goto_146

    .line 952
    .restart local v3    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_208
    if-ltz v8, :cond_23b

    instance-of v0, v3, Ljava/beans/IndexedPropertyDescriptor;

    move/from16 v17, v0

    if-eqz v17, :cond_23b

    move-object/from16 v17, v3

    .line 953
    check-cast v17, Ljava/beans/IndexedPropertyDescriptor;

    invoke-virtual/range {v17 .. v17}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v17

    if-nez v17, :cond_233

    .line 954
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Skipping read-only property"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_d0

    .line 959
    :cond_233
    check-cast v3, Ljava/beans/IndexedPropertyDescriptor;

    .end local v3    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v3}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedPropertyType()Ljava/lang/Class;

    move-result-object v15

    goto/16 :goto_146

    .line 961
    .restart local v3    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_23b
    if-eqz v9, :cond_274

    .line 962
    invoke-virtual {v3}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v17

    if-nez v17, :cond_25c

    .line 963
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 964
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Skipping read-only property"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_d0

    .line 968
    :cond_25c
    if-nez p3, :cond_26f

    sget-object v17, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v17, :cond_26c

    const-string v17, "java.lang.Object"

    invoke-static/range {v17 .. v17}, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v15

    .end local v15    # "type":Ljava/lang/Class;
    sput-object v15, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    .restart local v15    # "type":Ljava/lang/Class;
    :goto_26a
    goto/16 :goto_146

    :cond_26c
    sget-object v15, Lorg/apache/commons/beanutils/BeanUtilsBean;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_26a

    :cond_26f
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    goto :goto_26a

    .line 970
    :cond_274
    invoke-virtual {v3}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v17

    if-nez v17, :cond_293

    .line 971
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_d0

    .line 972
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/beanutils/BeanUtilsBean;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    const-string v18, "Skipping read-only property"

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto/16 :goto_d0

    .line 976
    :cond_293
    invoke-virtual {v3}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v15

    goto/16 :goto_146

    .line 987
    .end local v3    # "descriptor":Ljava/beans/PropertyDescriptor;
    .restart local v10    # "newValue":Ljava/lang/Object;
    :cond_299
    move-object/from16 v0, p3

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_2af

    .line 988
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 989
    :cond_2af
    move-object/from16 v0, p3

    instance-of v0, v0, [Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_2c9

    .line 990
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    check-cast p3, [Ljava/lang/String;

    .end local p3    # "value":Ljava/lang/Object;
    check-cast p3, [Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 992
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_2c9
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/BeanUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 994
    :cond_2d3
    invoke-virtual {v15}, Ljava/lang/Class;->isArray()Z

    move-result v17

    if-eqz v17, :cond_327

    .line 995
    move-object/from16 v0, p3

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v17, v0

    if-nez v17, :cond_2e3

    if-nez p3, :cond_2f9

    .line 996
    :cond_2e3
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    check-cast p3, Ljava/lang/String;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-virtual {v15}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 998
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_2f9
    move-object/from16 v0, p3

    instance-of v0, v0, [Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_317

    .line 999
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    check-cast p3, [Ljava/lang/String;

    .end local p3    # "value":Ljava/lang/Object;
    check-cast p3, [Ljava/lang/String;

    const/16 v18, 0x0

    aget-object v18, p3, v18

    invoke-virtual {v15}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v17 .. v19}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 1002
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_317
    invoke-virtual {v15}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/beanutils/BeanUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 1005
    :cond_327
    move-object/from16 v0, p3

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_33f

    .line 1006
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    check-cast p3, Ljava/lang/String;

    .end local p3    # "value":Ljava/lang/Object;
    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 1007
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_33f
    move-object/from16 v0, p3

    instance-of v0, v0, [Ljava/lang/String;

    move/from16 v17, v0

    if-eqz v17, :cond_35d

    .line 1008
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getConvertUtils()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v17

    check-cast p3, [Ljava/lang/String;

    .end local p3    # "value":Ljava/lang/Object;
    check-cast p3, [Ljava/lang/String;

    const/16 v18, 0x0

    aget-object v18, p3, v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b

    .line 1011
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_35d
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v15}, Lorg/apache/commons/beanutils/BeanUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    goto/16 :goto_16b
.end method
