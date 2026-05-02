.class public Lorg/apache/commons/beanutils/PropertyUtilsBean;
.super Ljava/lang/Object;
.source "PropertyUtilsBean.java"


# static fields
.field private static final EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

.field private static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field private static final LIST_CLASS_PARAMETER:[Ljava/lang/Class;

.field static class$java$util$List:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$PropertyUtils:Ljava/lang/Class;


# instance fields
.field private descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

.field private log:Lorg/apache/commons/logging/Log;

.field private mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

.field private resolver:Lorg/apache/commons/beanutils/expression/Resolver;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 125
    new-array v0, v2, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    .line 126
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    sget-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    if-nez v0, :cond_1d

    const-string v0, "java.util.List"

    invoke-static {v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    :goto_14
    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/commons/beanutils/PropertyUtilsBean;->LIST_CLASS_PARAMETER:[Ljava/lang/Class;

    .line 129
    new-array v0, v2, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    return-void

    .line 126
    :cond_1d
    sget-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    goto :goto_14
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    new-instance v0, Lorg/apache/commons/beanutils/expression/DefaultResolver;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/expression/DefaultResolver;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    .line 123
    iput-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 124
    iput-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 132
    sget-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$org$apache$commons$beanutils$PropertyUtils:Ljava/lang/Class;

    if-nez v0, :cond_3b

    const-string v0, "org.apache.commons.beanutils.PropertyUtils"

    invoke-static {v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$org$apache$commons$beanutils$PropertyUtils:Ljava/lang/Class;

    :goto_1c
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    .line 138
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 139
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 140
    new-instance v0, Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    .line 141
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, v1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->setFast(Z)V

    .line 142
    return-void

    .line 132
    :cond_3b
    sget-object v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$org$apache$commons$beanutils$PropertyUtils:Ljava/lang/Class;

    goto :goto_1c
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 126
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

.method protected static getInstance()Lorg/apache/commons/beanutils/PropertyUtilsBean;
    .registers 1

    .prologue
    .line 114
    invoke-static {}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getInstance()Lorg/apache/commons/beanutils/BeanUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/BeanUtilsBean;->getPropertyUtils()Lorg/apache/commons/beanutils/PropertyUtilsBean;

    move-result-object v0

    return-object v0
.end method

.method private invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "bean"    # Ljava/lang/Object;
    .param p3, "values"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 2163
    if-nez p2, :cond_a

    .line 2164
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No bean specified - this should have been checked before reaching this method"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2170
    :cond_a
    :try_start_a
    invoke-virtual {p1, p2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/NullPointerException; {:try_start_a .. :try_end_d} :catch_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_d} :catch_110

    move-result-object v6

    return-object v6

    .line 2172
    :catch_f
    move-exception v0

    .line 2175
    .local v0, "cause":Ljava/lang/NullPointerException;
    const-string v5, ""

    .line 2176
    .local v5, "valueString":Ljava/lang/String;
    if-eqz p3, :cond_63

    .line 2177
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_15
    array-length v6, p3

    if-ge v3, v6, :cond_63

    .line 2178
    if-lez v3, :cond_2d

    .line 2179
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2181
    :cond_2d
    aget-object v6, p3, v3

    if-nez v6, :cond_47

    .line 2182
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "<null>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2177
    :goto_44
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    .line 2184
    :cond_47
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, p3, v3

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_44

    .line 2188
    .end local v3    # "i":I
    :cond_63
    const-string v2, ""

    .line 2189
    .local v2, "expectedString":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 2190
    .local v4, "parTypes":[Ljava/lang/Class;
    if-eqz v4, :cond_9e

    .line 2191
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_6c
    array-length v6, v4

    if-ge v3, v6, :cond_9e

    .line 2192
    if-lez v3, :cond_84

    .line 2193
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2195
    :cond_84
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, v4, v3

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2191
    add-int/lit8 v3, v3, 0x1

    goto :goto_6c

    .line 2198
    .end local v3    # "i":I
    :cond_9e
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Cannot invoke "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " - had objects of type \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\" but expected signature \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 2207
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-static {v1, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v6

    if-nez v6, :cond_10f

    .line 2208
    iget-object v6, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Method invocation failed"

    invoke-interface {v6, v7, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 2210
    :cond_10f
    throw v1

    .line 2211
    .end local v0    # "cause":Ljava/lang/NullPointerException;
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    .end local v2    # "expectedString":Ljava/lang/String;
    .end local v4    # "parTypes":[Ljava/lang/Class;
    .end local v5    # "valueString":Ljava/lang/String;
    :catch_110
    move-exception v0

    .line 2212
    .local v0, "cause":Ljava/lang/IllegalArgumentException;
    const-string v5, ""

    .line 2213
    .restart local v5    # "valueString":Ljava/lang/String;
    if-eqz p3, :cond_164

    .line 2214
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_116
    array-length v6, p3

    if-ge v3, v6, :cond_164

    .line 2215
    if-lez v3, :cond_12e

    .line 2216
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2218
    :cond_12e
    aget-object v6, p3, v3

    if-nez v6, :cond_148

    .line 2219
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "<null>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2214
    :goto_145
    add-int/lit8 v3, v3, 0x1

    goto :goto_116

    .line 2221
    :cond_148
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, p3, v3

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_145

    .line 2225
    .end local v3    # "i":I
    :cond_164
    const-string v2, ""

    .line 2226
    .restart local v2    # "expectedString":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 2227
    .restart local v4    # "parTypes":[Ljava/lang/Class;
    if-eqz v4, :cond_19f

    .line 2228
    const/4 v3, 0x0

    .restart local v3    # "i":I
    :goto_16d
    array-length v6, v4

    if-ge v3, v6, :cond_19f

    .line 2229
    if-lez v3, :cond_185

    .line 2230
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2232
    :cond_185
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, v4, v3

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2228
    add-int/lit8 v3, v3, 0x1

    goto :goto_16d

    .line 2235
    .end local v3    # "i":I
    :cond_19f
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Cannot invoke "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " - had objects of type \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\" but expected signature \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 2244
    .restart local v1    # "e":Ljava/lang/IllegalArgumentException;
    invoke-static {v1, v0}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    move-result v6

    if-nez v6, :cond_210

    .line 2245
    iget-object v6, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    const-string v7, "Method invocation failed"

    invoke-interface {v6, v7, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 2247
    :cond_210
    throw v1
.end method


# virtual methods
.method public clearDescriptors()V
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->clear()V

    .line 194
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->clear()V

    .line 195
    invoke-static {}, Ljava/beans/Introspector;->flushCaches()V

    .line 197
    return-void
.end method

.method public copyProperties(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 14
    .param p1, "dest"    # Ljava/lang/Object;
    .param p2, "orig"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 235
    if-nez p1, :cond_a

    .line 236
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "No destination bean specified"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 239
    :cond_a
    if-nez p2, :cond_14

    .line 240
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "No origin bean specified"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 243
    :cond_14
    instance-of v8, p2, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v8, :cond_89

    move-object v8, p2

    .line 244
    check-cast v8, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v8}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v6

    .line 246
    .local v6, "origDescriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_24
    array-length v8, v6

    if-ge v4, v8, :cond_163

    .line 247
    aget-object v8, v6, v4

    invoke-virtual {v8}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v5

    .line 248
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {p0, p2, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isReadable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4c

    invoke-virtual {p0, p1, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4c

    .line 250
    :try_start_39
    move-object v0, p2

    check-cast v0, Lorg/apache/commons/beanutils/DynaBean;

    move-object v8, v0

    invoke-interface {v8, v5}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 251
    .local v7, "value":Ljava/lang/Object;
    instance-of v8, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v8, :cond_4f

    .line 252
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/beanutils/DynaBean;

    move-object v8, v0

    invoke-interface {v8, v5, v7}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 246
    .end local v7    # "value":Ljava/lang/Object;
    :cond_4c
    :goto_4c
    add-int/lit8 v4, v4, 0x1

    goto :goto_24

    .line 254
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_4f
    invoke-virtual {p0, p1, v5, v7}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_52
    .catch Ljava/lang/NoSuchMethodException; {:try_start_39 .. :try_end_52} :catch_53

    goto :goto_4c

    .line 256
    .end local v7    # "value":Ljava/lang/Object;
    :catch_53
    move-exception v1

    .line 257
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_4c

    .line 258
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Error writing to \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\' on class \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_4c

    .line 263
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v4    # "i":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "origDescriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    :cond_89
    instance-of v8, p2, Ljava/util/Map;

    if-eqz v8, :cond_fd

    .line 264
    check-cast p2, Ljava/util/Map;

    .end local p2    # "orig":Ljava/lang/Object;
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 265
    .local v2, "entries":Ljava/util/Iterator;
    :cond_97
    :goto_97
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_163

    .line 266
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 267
    .local v3, "entry":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 268
    .restart local v5    # "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_97

    .line 270
    :try_start_af
    instance-of v8, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v8, :cond_f5

    .line 271
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/beanutils/DynaBean;

    move-object v8, v0

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v5, v9}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_be
    .catch Ljava/lang/NoSuchMethodException; {:try_start_af .. :try_end_be} :catch_bf

    goto :goto_97

    .line 275
    :catch_bf
    move-exception v1

    .line 276
    .restart local v1    # "e":Ljava/lang/NoSuchMethodException;
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_97

    .line 277
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Error writing to \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\' on class \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_97

    .line 273
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :cond_f5
    :try_start_f5
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {p0, p1, v5, v8}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_fc
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f5 .. :try_end_fc} :catch_bf

    goto :goto_97

    .line 283
    .end local v2    # "entries":Ljava/util/Iterator;
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v5    # "name":Ljava/lang/String;
    .restart local p2    # "orig":Ljava/lang/Object;
    :cond_fd
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;

    move-result-object v6

    .line 285
    .local v6, "origDescriptors":[Ljava/beans/PropertyDescriptor;
    const/4 v4, 0x0

    .restart local v4    # "i":I
    :goto_102
    array-length v8, v6

    if-ge v4, v8, :cond_163

    .line 286
    aget-object v8, v6, v4

    invoke-virtual {v8}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v5

    .line 287
    .restart local v5    # "name":Ljava/lang/String;
    invoke-virtual {p0, p2, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isReadable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_126

    invoke-virtual {p0, p1, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_126

    .line 289
    :try_start_117
    invoke-virtual {p0, p2, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 290
    .restart local v7    # "value":Ljava/lang/Object;
    instance-of v8, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v8, :cond_129

    .line 291
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/beanutils/DynaBean;

    move-object v8, v0

    invoke-interface {v8, v5, v7}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 285
    .end local v7    # "value":Ljava/lang/Object;
    :cond_126
    :goto_126
    add-int/lit8 v4, v4, 0x1

    goto :goto_102

    .line 293
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_129
    invoke-virtual {p0, p1, v5, v7}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_12c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_117 .. :try_end_12c} :catch_12d

    goto :goto_126

    .line 295
    .end local v7    # "value":Ljava/lang/Object;
    :catch_12d
    move-exception v1

    .line 296
    .restart local v1    # "e":Ljava/lang/NoSuchMethodException;
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v8

    if-eqz v8, :cond_126

    .line 297
    iget-object v8, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Error writing to \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\' on class \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_126

    .line 304
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v4    # "i":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "origDescriptors":[Ljava/beans/PropertyDescriptor;
    .end local p2    # "orig":Ljava/lang/Object;
    :cond_163
    return-void
.end method

.method public describe(Ljava/lang/Object;)Ljava/util/Map;
    .registers 8
    .param p1, "bean"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 330
    if-nez p1, :cond_a

    .line 331
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "No bean specified"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 333
    :cond_a
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 334
    .local v0, "description":Ljava/util/Map;
    instance-of v4, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v4, :cond_32

    move-object v4, p1

    .line 335
    check-cast v4, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v4}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 337
    .local v1, "descriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1f
    array-length v4, v1

    if-ge v2, v4, :cond_52

    .line 338
    aget-object v4, v1, v2

    invoke-virtual {v4}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v3

    .line 339
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 342
    .end local v1    # "descriptors":[Lorg/apache/commons/beanutils/DynaProperty;
    .end local v2    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_32
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;

    move-result-object v1

    .line 344
    .local v1, "descriptors":[Ljava/beans/PropertyDescriptor;
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_37
    array-length v4, v1

    if-ge v2, v4, :cond_52

    .line 345
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    .line 346
    .restart local v3    # "name":Ljava/lang/String;
    aget-object v4, v1, v2

    invoke-virtual {v4}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    if-eqz v4, :cond_4f

    .line 347
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    :cond_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 351
    .end local v1    # "descriptors":[Ljava/beans/PropertyDescriptor;
    .end local v3    # "name":Ljava/lang/String;
    :cond_52
    return-object v0
.end method

.method public getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
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
    .line 384
    if-nez p1, :cond_a

    .line 385
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 387
    :cond_a
    if-nez p2, :cond_2f

    .line 388
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 393
    :cond_2f
    const/4 v1, -0x1

    .line 395
    .local v1, "index":I
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getIndex(Ljava/lang/String;)I
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_35} :catch_65

    move-result v1

    .line 401
    if-gez v1, :cond_9b

    .line 402
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid indexed property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 396
    :catch_65
    move-exception v0

    .line 397
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid indexed property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 407
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_9b
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 410
    invoke-virtual {p0, p1, p2, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    .registers 12
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
    .line 442
    if-nez p1, :cond_a

    .line 443
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "No bean specified"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 445
    :cond_a
    if-eqz p2, :cond_12

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_2c

    .line 446
    :cond_12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-eqz v5, :cond_21

    .line 447
    invoke-static {p1, p3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    .line 518
    .end local p1    # "bean":Ljava/lang/Object;
    :goto_20
    return-object v5

    .line 448
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_21
    instance-of v5, p1, Ljava/util/List;

    if-eqz v5, :cond_2c

    .line 449
    check-cast p1, Ljava/util/List;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_20

    .line 452
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_2c
    if-nez p2, :cond_51

    .line 453
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "No name specified for bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 458
    :cond_51
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_96

    move-object v5, p1

    .line 459
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 461
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_8f

    .line 462
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unknown property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 465
    :cond_8f
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v5

    goto :goto_20

    .line 469
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_96
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 471
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_c9

    .line 472
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unknown property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 477
    :cond_c9
    instance-of v5, v0, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v5, :cond_100

    move-object v5, v0

    .line 478
    check-cast v5, Ljava/beans/IndexedPropertyDescriptor;

    invoke-virtual {v5}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    .line 480
    .local v2, "readMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v2}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 481
    if-eqz v2, :cond_100

    .line 482
    const/4 v5, 0x1

    new-array v3, v5, [Ljava/lang/Object;

    .line 483
    .local v3, "subscript":[Ljava/lang/Object;
    const/4 v5, 0x0

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, p3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v6, v3, v5

    .line 485
    :try_start_e9
    invoke-direct {p0, v2, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_ec
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_e9 .. :try_end_ec} :catch_ef

    move-result-object v5

    goto/16 :goto_20

    .line 486
    :catch_ef
    move-exception v1

    .line 487
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/IndexOutOfBoundsException;

    if-eqz v5, :cond_ff

    .line 489
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    check-cast v5, Ljava/lang/IndexOutOfBoundsException;

    throw v5

    .line 492
    :cond_ff
    throw v1

    .line 499
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "readMethod":Ljava/lang/reflect/Method;
    .end local v3    # "subscript":[Ljava/lang/Object;
    :cond_100
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 500
    .restart local v2    # "readMethod":Ljava/lang/reflect/Method;
    if-nez v2, :cond_13d

    .line 501
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' has no "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "getter method on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 506
    :cond_13d
    sget-object v5, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-direct {p0, v2, p1, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 507
    .local v4, "value":Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-nez v5, :cond_186

    .line 508
    instance-of v5, v4, Ljava/util/List;

    if-nez v5, :cond_17e

    .line 509
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' is not indexed on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 513
    :cond_17e
    check-cast v4, Ljava/util/List;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-interface {v4, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    goto/16 :goto_20

    .line 518
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_186
    :try_start_186
    invoke-static {v4, p3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;
    :try_end_189
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_186 .. :try_end_189} :catch_18c

    move-result-object v5

    goto/16 :goto_20

    .line 519
    :catch_18c
    move-exception v1

    .line 520
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v5, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Index: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ", Size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {v4}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " for property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
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
    .line 552
    if-nez p1, :cond_a

    .line 553
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 555
    :cond_a
    if-nez p2, :cond_2f

    .line 556
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 561
    :cond_2f
    const/4 v1, 0x0

    .line 563
    .local v1, "key":Ljava/lang/String;
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_35} :catch_65

    move-result-object v1

    .line 569
    if-nez v1, :cond_9b

    .line 570
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid mapped property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 564
    :catch_65
    move-exception v0

    .line 565
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid mapped property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 575
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_9b
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 578
    invoke-virtual {p0, p1, p2, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 12
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
    .line 604
    if-nez p1, :cond_a

    .line 605
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "No bean specified"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 607
    :cond_a
    if-nez p2, :cond_2f

    .line 608
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "No name specified for bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 611
    :cond_2f
    if-nez p3, :cond_5e

    .line 612
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "No key specified for property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' on bean class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 617
    :cond_5e
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_a3

    move-object v5, p1

    .line 618
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 620
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_9c

    .line 621
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unknown property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'+ on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 624
    :cond_9c
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 665
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_a2
    :goto_a2
    return-object v4

    .line 627
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_a3
    const/4 v4, 0x0

    .line 630
    .local v4, "result":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 631
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_d7

    .line 632
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unknown property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'+ on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 636
    :cond_d7
    instance-of v5, v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    if-eqz v5, :cond_123

    .line 638
    check-cast v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 640
    .local v3, "readMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v3}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 641
    if-eqz v3, :cond_f6

    .line 642
    const/4 v5, 0x1

    new-array v2, v5, [Ljava/lang/Object;

    .line 643
    .local v2, "keyArray":[Ljava/lang/Object;
    const/4 v5, 0x0

    aput-object p3, v2, v5

    .line 644
    invoke-direct {p0, v3, p1, v2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 645
    goto :goto_a2

    .line 646
    .end local v2    # "keyArray":[Ljava/lang/Object;
    :cond_f6
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' has no mapped getter method on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 652
    .end local v3    # "readMethod":Ljava/lang/reflect/Method;
    .restart local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_123
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 653
    .restart local v3    # "readMethod":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_13f

    .line 654
    sget-object v5, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-direct {p0, v3, p1, v5}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 656
    .local v1, "invokeResult":Ljava/lang/Object;
    instance-of v5, v1, Ljava/util/Map;

    if-eqz v5, :cond_a2

    .line 657
    check-cast v1, Ljava/util/Map;

    .end local v1    # "invokeResult":Ljava/lang/Object;
    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_a2

    .line 660
    :cond_13f
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' has no mapped getter method on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public getMappedPropertyDescriptors(Ljava/lang/Class;)Lorg/apache/commons/collections/FastHashMap;
    .registers 3
    .param p1, "beanClass"    # Ljava/lang/Class;

    .prologue
    .line 681
    if-nez p1, :cond_4

    .line 682
    const/4 v0, 0x0

    .line 686
    :goto_3
    return-object v0

    :cond_4
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {v0, p1}, Lorg/apache/commons/beanutils/WeakFastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/collections/FastHashMap;

    goto :goto_3
.end method

.method public getMappedPropertyDescriptors(Ljava/lang/Object;)Lorg/apache/commons/collections/FastHashMap;
    .registers 3
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 702
    if-nez p1, :cond_4

    .line 703
    const/4 v0, 0x0

    .line 705
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedPropertyDescriptors(Ljava/lang/Class;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v0

    goto :goto_3
.end method

.method public getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
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
    .line 733
    if-nez p1, :cond_a

    .line 734
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 736
    :cond_a
    if-nez p2, :cond_36

    .line 737
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 759
    .local v0, "nestedBean":Ljava/lang/Object;
    .local v1, "next":Ljava/lang/String;
    :cond_2f
    move-object p1, v0

    .line 760
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 742
    .end local v0    # "nestedBean":Ljava/lang/Object;
    .end local v1    # "next":Ljava/lang/String;
    :cond_36
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9e

    .line 743
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 744
    .restart local v1    # "next":Ljava/lang/String;
    const/4 v0, 0x0

    .line 745
    .restart local v0    # "nestedBean":Ljava/lang/Object;
    instance-of v2, p1, Ljava/util/Map;

    if-eqz v2, :cond_7f

    move-object v2, p1

    .line 746
    check-cast v2, Ljava/util/Map;

    invoke-virtual {p0, v2, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 754
    :goto_50
    if-nez v0, :cond_2f

    .line 755
    new-instance v2, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Null property value for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 747
    :cond_7f
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, v1}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 748
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 749
    :cond_8c
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, v1}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_99

    .line 750
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 752
    :cond_99
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 763
    .end local v0    # "nestedBean":Ljava/lang/Object;
    .end local v1    # "next":Ljava/lang/String;
    :cond_9e
    instance-of v2, p1, Ljava/util/Map;

    if-eqz v2, :cond_a9

    .line 764
    check-cast p1, Ljava/util/Map;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 772
    .restart local p1    # "bean":Ljava/lang/Object;
    :goto_a8
    return-object p1

    .line 765
    :cond_a9
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b6

    .line 766
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_a8

    .line 767
    :cond_b6
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c3

    .line 768
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_a8

    .line 770
    :cond_c3
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    goto :goto_a8
.end method

.method public getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
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
    .line 846
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getNestedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;
    .registers 13
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
    .line 882
    if-nez p1, :cond_a

    .line 883
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "No bean specified"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 885
    :cond_a
    if-nez p2, :cond_36

    .line 886
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "No name specified for bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 899
    .local v3, "nestedBean":Ljava/lang/Object;
    .local v4, "next":Ljava/lang/String;
    :cond_2f
    move-object p1, v3

    .line 900
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v7, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 891
    .end local v3    # "nestedBean":Ljava/lang/Object;
    .end local v4    # "next":Ljava/lang/String;
    :cond_36
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v7, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_77

    .line 892
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v7, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 893
    .restart local v4    # "next":Ljava/lang/String;
    invoke-virtual {p0, p1, v4}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 894
    .restart local v3    # "nestedBean":Ljava/lang/Object;
    if-nez v3, :cond_2f

    .line 895
    new-instance v7, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Null property value for \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' on bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 904
    .end local v3    # "nestedBean":Ljava/lang/Object;
    .end local v4    # "next":Ljava/lang/String;
    :cond_77
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v7, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 908
    if-nez p2, :cond_81

    .line 909
    const/4 v5, 0x0

    .line 945
    :cond_80
    :goto_80
    return-object v5

    .line 912
    :cond_81
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 913
    .local v0, "descriptors":[Ljava/beans/PropertyDescriptor;
    if-eqz v0, :cond_9d

    .line 915
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_88
    array-length v7, v0

    if-ge v1, v7, :cond_9d

    .line 916
    aget-object v7, v0, v1

    invoke-virtual {v7}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9a

    .line 917
    aget-object v5, v0, v1

    goto :goto_80

    .line 915
    :cond_9a
    add-int/lit8 v1, v1, 0x1

    goto :goto_88

    .line 922
    .end local v1    # "i":I
    :cond_9d
    const/4 v5, 0x0

    .line 923
    .local v5, "result":Ljava/beans/PropertyDescriptor;
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedPropertyDescriptors(Ljava/lang/Object;)Lorg/apache/commons/collections/FastHashMap;

    move-result-object v2

    .line 925
    .local v2, "mappedDescriptors":Lorg/apache/commons/collections/FastHashMap;
    if-nez v2, :cond_b6

    .line 926
    new-instance v2, Lorg/apache/commons/collections/FastHashMap;

    .end local v2    # "mappedDescriptors":Lorg/apache/commons/collections/FastHashMap;
    invoke-direct {v2}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    .line 927
    .restart local v2    # "mappedDescriptors":Lorg/apache/commons/collections/FastHashMap;
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 928
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->mappedDescriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Lorg/apache/commons/beanutils/WeakFastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 930
    :cond_b6
    invoke-virtual {v2, p2}, Lorg/apache/commons/collections/FastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "result":Ljava/beans/PropertyDescriptor;
    check-cast v5, Ljava/beans/PropertyDescriptor;

    .line 931
    .restart local v5    # "result":Ljava/beans/PropertyDescriptor;
    if-nez v5, :cond_80

    .line 934
    :try_start_be
    new-instance v6, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-direct {v6, p2, v7}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V
    :try_end_c7
    .catch Ljava/beans/IntrospectionException; {:try_start_be .. :try_end_c7} :catch_ce

    .end local v5    # "result":Ljava/beans/PropertyDescriptor;
    .local v6, "result":Ljava/beans/PropertyDescriptor;
    move-object v5, v6

    .line 940
    .end local v6    # "result":Ljava/beans/PropertyDescriptor;
    .restart local v5    # "result":Ljava/beans/PropertyDescriptor;
    :goto_c8
    if-eqz v5, :cond_80

    .line 941
    invoke-virtual {v2, p2, v5}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_80

    .line 935
    :catch_ce
    move-exception v7

    goto :goto_c8
.end method

.method public getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;
    .registers 19
    .param p1, "beanClass"    # Ljava/lang/Class;

    .prologue
    .line 965
    if-nez p1, :cond_a

    .line 966
    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "No bean class specified"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 970
    :cond_a
    const/4 v3, 0x0

    .line 971
    .local v3, "descriptors":[Ljava/beans/PropertyDescriptor;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lorg/apache/commons/beanutils/WeakFastHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [Ljava/beans/PropertyDescriptor;

    move-object v3, v13

    check-cast v3, [Ljava/beans/PropertyDescriptor;

    .line 973
    if-eqz v3, :cond_1e

    move-object v13, v3

    .line 1062
    :goto_1d
    return-object v13

    .line 978
    :cond_1e
    const/4 v1, 0x0

    .line 980
    .local v1, "beanInfo":Ljava/beans/BeanInfo;
    :try_start_1f
    invoke-static/range {p1 .. p1}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;
    :try_end_22
    .catch Ljava/beans/IntrospectionException; {:try_start_1f .. :try_end_22} :catch_e0

    move-result-object v1

    .line 984
    invoke-interface {v1}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;

    move-result-object v3

    .line 985
    if-nez v3, :cond_2c

    .line 986
    const/4 v13, 0x0

    new-array v3, v13, [Ljava/beans/PropertyDescriptor;

    .line 1008
    :cond_2c
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2d
    array-length v13, v3

    if-ge v5, v13, :cond_12d

    .line 1009
    aget-object v13, v3, v5

    instance-of v13, v13, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v13, :cond_dc

    .line 1010
    aget-object v2, v3, v5

    check-cast v2, Ljava/beans/IndexedPropertyDescriptor;

    .line 1011
    .local v2, "descriptor":Ljava/beans/IndexedPropertyDescriptor;
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x1

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1014
    .local v10, "propName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    if-nez v13, :cond_84

    .line 1015
    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    if-eqz v13, :cond_e6

    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    .line 1018
    .local v7, "methodName":Ljava/lang/String;
    :goto_77
    sget-object v13, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_CLASS_PARAMETERS:[Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-static {v0, v7, v13}, Lorg/apache/commons/beanutils/MethodUtils;->getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v11

    .line 1021
    .local v11, "readMethod":Ljava/lang/reflect/Method;
    if-eqz v11, :cond_84

    .line 1023
    :try_start_81
    invoke-virtual {v2, v11}, Ljava/beans/IndexedPropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_84} :catch_fb

    .line 1029
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v11    # "readMethod":Ljava/lang/reflect/Method;
    :cond_84
    :goto_84
    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    if-nez v13, :cond_dc

    .line 1030
    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    if-eqz v13, :cond_107

    invoke-virtual {v2}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    .line 1033
    .restart local v7    # "methodName":Ljava/lang/String;
    :goto_98
    sget-object v13, Lorg/apache/commons/beanutils/PropertyUtilsBean;->LIST_CLASS_PARAMETER:[Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-static {v0, v7, v13}, Lorg/apache/commons/beanutils/MethodUtils;->getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 1036
    .local v12, "writeMethod":Ljava/lang/reflect/Method;
    if-nez v12, :cond_d7

    .line 1037
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    .line 1038
    .local v8, "methods":[Ljava/lang/reflect/Method;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_a7
    array-length v13, v8

    if-ge v6, v13, :cond_d7

    .line 1039
    aget-object v13, v8, v6

    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_11f

    .line 1040
    aget-object v13, v8, v6

    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 1041
    .local v9, "parameterTypes":[Ljava/lang/Class;
    array-length v13, v9

    const/4 v14, 0x1

    if-ne v13, v14, :cond_11f

    sget-object v13, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    if-nez v13, :cond_11c

    const-string v13, "java.util.List"

    invoke-static {v13}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    sput-object v13, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    :goto_cc
    const/4 v14, 0x0

    aget-object v14, v9, v14

    invoke-virtual {v13, v14}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v13

    if-eqz v13, :cond_11f

    .line 1043
    aget-object v12, v8, v6

    .line 1049
    .end local v6    # "j":I
    .end local v8    # "methods":[Ljava/lang/reflect/Method;
    .end local v9    # "parameterTypes":[Ljava/lang/Class;
    :cond_d7
    if-eqz v12, :cond_dc

    .line 1051
    :try_start_d9
    invoke-virtual {v2, v12}, Ljava/beans/IndexedPropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V
    :try_end_dc
    .catch Ljava/lang/Exception; {:try_start_d9 .. :try_end_dc} :catch_122

    .line 1008
    .end local v2    # "descriptor":Ljava/beans/IndexedPropertyDescriptor;
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v10    # "propName":Ljava/lang/String;
    .end local v12    # "writeMethod":Ljava/lang/reflect/Method;
    :cond_dc
    :goto_dc
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_2d

    .line 981
    .end local v5    # "i":I
    :catch_e0
    move-exception v4

    .line 982
    .local v4, "e":Ljava/beans/IntrospectionException;
    const/4 v13, 0x0

    new-array v13, v13, [Ljava/beans/PropertyDescriptor;

    goto/16 :goto_1d

    .line 1015
    .end local v4    # "e":Ljava/beans/IntrospectionException;
    .restart local v2    # "descriptor":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v5    # "i":I
    .restart local v10    # "propName":Ljava/lang/String;
    :cond_e6
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string v14, "get"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_77

    .line 1024
    .restart local v7    # "methodName":Ljava/lang/String;
    .restart local v11    # "readMethod":Ljava/lang/reflect/Method;
    :catch_fb
    move-exception v4

    .line 1025
    .local v4, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "Error setting indexed property read method"

    invoke-interface {v13, v14, v4}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_84

    .line 1030
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v11    # "readMethod":Ljava/lang/reflect/Method;
    :cond_107
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string v14, "set"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_98

    .line 1041
    .restart local v6    # "j":I
    .restart local v7    # "methodName":Ljava/lang/String;
    .restart local v8    # "methods":[Ljava/lang/reflect/Method;
    .restart local v9    # "parameterTypes":[Ljava/lang/Class;
    .restart local v12    # "writeMethod":Ljava/lang/reflect/Method;
    :cond_11c
    sget-object v13, Lorg/apache/commons/beanutils/PropertyUtilsBean;->class$java$util$List:Ljava/lang/Class;

    goto :goto_cc

    .line 1038
    .end local v9    # "parameterTypes":[Ljava/lang/Class;
    :cond_11f
    add-int/lit8 v6, v6, 0x1

    goto :goto_a7

    .line 1052
    .end local v6    # "j":I
    .end local v8    # "methods":[Ljava/lang/reflect/Method;
    :catch_122
    move-exception v4

    .line 1053
    .restart local v4    # "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    const-string v14, "Error setting indexed property write method"

    invoke-interface {v13, v14, v4}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_dc

    .line 1061
    .end local v2    # "descriptor":Ljava/beans/IndexedPropertyDescriptor;
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v7    # "methodName":Ljava/lang/String;
    .end local v10    # "propName":Ljava/lang/String;
    .end local v12    # "writeMethod":Ljava/lang/reflect/Method;
    :cond_12d
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->descriptorsCache:Lorg/apache/commons/beanutils/WeakFastHashMap;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0, v3}, Lorg/apache/commons/beanutils/WeakFastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v13, v3

    .line 1062
    goto/16 :goto_1d
.end method

.method public getPropertyDescriptors(Ljava/lang/Object;)[Ljava/beans/PropertyDescriptor;
    .registers 4
    .param p1, "bean"    # Ljava/lang/Object;

    .prologue
    .line 1081
    if-nez p1, :cond_a

    .line 1082
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No bean specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1084
    :cond_a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptors(Ljava/lang/Class;)[Ljava/beans/PropertyDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyEditorClass(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Class;
    .registers 7
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
    .line 1123
    if-nez p1, :cond_a

    .line 1124
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No bean specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1126
    :cond_a
    if-nez p2, :cond_2f

    .line 1127
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No name specified for bean class \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1131
    :cond_2f
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1133
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-eqz v0, :cond_3a

    .line 1134
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getPropertyEditorClass()Ljava/lang/Class;

    move-result-object v1

    .line 1136
    :goto_39
    return-object v1

    :cond_3a
    const/4 v1, 0x0

    goto :goto_39
.end method

.method protected getPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "bean"    # Ljava/util/Map;
    .param p2, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 804
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 805
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 806
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1c

    .line 807
    :cond_16
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 811
    .end local v0    # "name":Ljava/lang/String;
    :cond_1c
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2c

    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 813
    :cond_2c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Indexed or mapped properties are not supported on objects of type Map: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 818
    :cond_45
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public getPropertyType(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Class;
    .registers 10
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
    const/4 v4, 0x0

    .line 1171
    if-nez p1, :cond_b

    .line 1172
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "No bean specified"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1174
    :cond_b
    if-nez p2, :cond_37

    .line 1175
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "No name specified for bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1188
    .local v1, "nestedBean":Ljava/lang/Object;
    .local v2, "next":Ljava/lang/String;
    :cond_30
    move-object p1, v1

    .line 1189
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1180
    .end local v1    # "nestedBean":Ljava/lang/Object;
    .end local v2    # "next":Ljava/lang/String;
    :cond_37
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_78

    .line 1181
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1182
    .restart local v2    # "next":Ljava/lang/String;
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 1183
    .restart local v1    # "nestedBean":Ljava/lang/Object;
    if-nez v1, :cond_30

    .line 1184
    new-instance v4, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Null property value for \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1193
    .end local v1    # "nestedBean":Ljava/lang/Object;
    .end local v2    # "next":Ljava/lang/String;
    :cond_78
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1196
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_a3

    .line 1197
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 1199
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_90

    move-object v3, v4

    .line 1223
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_8f
    :goto_8f
    return-object v3

    .line 1202
    .restart local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_90
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    .line 1203
    .local v3, "type":Ljava/lang/Class;
    if-nez v3, :cond_98

    move-object v3, v4

    .line 1204
    goto :goto_8f

    .line 1205
    :cond_98
    invoke-virtual {v3}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_8f

    .line 1206
    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    goto :goto_8f

    .line 1212
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    .end local v3    # "type":Ljava/lang/Class;
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_a3
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1214
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_ab

    move-object v3, v4

    .line 1215
    goto :goto_8f

    .line 1216
    :cond_ab
    instance-of v4, v0, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v4, :cond_b6

    .line 1217
    check-cast v0, Ljava/beans/IndexedPropertyDescriptor;

    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedPropertyType()Ljava/lang/Class;

    move-result-object v3

    goto :goto_8f

    .line 1219
    .restart local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_b6
    instance-of v4, v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    if-eqz v4, :cond_c1

    .line 1220
    check-cast v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedPropertyType()Ljava/lang/Class;

    move-result-object v3

    goto :goto_8f

    .line 1223
    .restart local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_c1
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v3

    goto :goto_8f
.end method

.method public getReadMethod(Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "descriptor"    # Ljava/beans/PropertyDescriptor;

    .prologue
    .line 1240
    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "descriptor"    # Ljava/beans/PropertyDescriptor;

    .prologue
    .line 1256
    invoke-virtual {p2}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public getResolver()Lorg/apache/commons/beanutils/expression/Resolver;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    return-object v0
.end method

.method public getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
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
    .line 1283
    if-nez p1, :cond_a

    .line 1284
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "No bean specified"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1286
    :cond_a
    if-nez p2, :cond_2f

    .line 1287
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "No name specified for bean class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1292
    :cond_2f
    iget-object v3, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v3, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 1293
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Nested property names are not allowed: Property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' on bean class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1296
    :cond_64
    iget-object v3, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v3, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_99

    .line 1297
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Indexed property names are not allowed: Property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' on bean class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1300
    :cond_99
    iget-object v3, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v3, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_ce

    .line 1301
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Mapped property names are not allowed: Property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' on bean class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1307
    :cond_ce
    instance-of v3, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v3, :cond_115

    move-object v3, p1

    .line 1308
    check-cast v3, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v3}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v3

    invoke-interface {v3, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 1310
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_10e

    .line 1311
    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unknown property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' on dynaclass \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1315
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_10e
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2}, Lorg/apache/commons/beanutils/DynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 1333
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :goto_114
    return-object v2

    .line 1319
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_115
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1321
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_148

    .line 1322
    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unknown property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' on class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1325
    :cond_148
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 1326
    .local v1, "readMethod":Ljava/lang/reflect/Method;
    if-nez v1, :cond_17f

    .line 1327
    new-instance v3, Ljava/lang/NoSuchMethodException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' has no getter method in class \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1332
    :cond_17f
    sget-object v3, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-direct {p0, v1, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1333
    .local v2, "value":Ljava/lang/Object;
    goto :goto_114
.end method

.method public getWriteMethod(Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "descriptor"    # Ljava/beans/PropertyDescriptor;

    .prologue
    .line 1349
    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method getWriteMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "descriptor"    # Ljava/beans/PropertyDescriptor;

    .prologue
    .line 1365
    invoke-virtual {p2}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public isReadable(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 11
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1387
    if-nez p1, :cond_c

    .line 1388
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "No bean specified"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1390
    :cond_c
    if-nez p2, :cond_38

    .line 1391
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "No name specified for bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1413
    .local v2, "nestedBean":Ljava/lang/Object;
    .local v3, "next":Ljava/lang/String;
    :cond_31
    move-object p1, v2

    .line 1414
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1396
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_38
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 1397
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1398
    .restart local v3    # "next":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1400
    .restart local v2    # "nestedBean":Ljava/lang/Object;
    :try_start_47
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/IllegalAccessException; {:try_start_47 .. :try_end_4a} :catch_7a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_47 .. :try_end_4a} :catch_7c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_47 .. :try_end_4a} :catch_7e

    move-result-object v2

    .line 1408
    if-nez v2, :cond_31

    .line 1409
    new-instance v5, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Null property value for \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1401
    :catch_7a
    move-exception v1

    .line 1453
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_7b
    :goto_7b
    return v7

    .line 1403
    .restart local v2    # "nestedBean":Ljava/lang/Object;
    .restart local v3    # "next":Ljava/lang/String;
    :catch_7c
    move-exception v1

    .line 1404
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_7b

    .line 1405
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_7e
    move-exception v1

    .line 1406
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_7b

    .line 1418
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_80
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1422
    instance-of v5, p1, Lorg/apache/commons/beanutils/WrapDynaBean;

    if-eqz v5, :cond_90

    .line 1423
    check-cast p1, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object p1

    .line 1427
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_90
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_a6

    move-object v5, p1

    .line 1429
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v5

    if-eqz v5, :cond_a4

    move v5, v6

    :goto_a2
    move v7, v5

    goto :goto_7b

    :cond_a4
    move v5, v7

    goto :goto_a2

    .line 1432
    :cond_a6
    :try_start_a6
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1434
    .local v0, "desc":Ljava/beans/PropertyDescriptor;
    if-eqz v0, :cond_7b

    .line 1435
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1436
    .local v4, "readMethod":Ljava/lang/reflect/Method;
    if-nez v4, :cond_c8

    .line 1437
    instance-of v5, v0, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v5, :cond_cc

    .line 1438
    check-cast v0, Ljava/beans/IndexedPropertyDescriptor;

    .end local v0    # "desc":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1442
    :cond_c0
    :goto_c0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1444
    :cond_c8
    if-eqz v4, :cond_d7

    :goto_ca
    move v7, v6

    goto :goto_7b

    .line 1439
    .restart local v0    # "desc":Ljava/beans/PropertyDescriptor;
    :cond_cc
    instance-of v5, v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    if-eqz v5, :cond_c0

    .line 1440
    check-cast v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v0    # "desc":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedReadMethod()Ljava/lang/reflect/Method;
    :try_end_d5
    .catch Ljava/lang/IllegalAccessException; {:try_start_a6 .. :try_end_d5} :catch_d9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_a6 .. :try_end_d5} :catch_db
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a6 .. :try_end_d5} :catch_dd

    move-result-object v4

    goto :goto_c0

    :cond_d7
    move v6, v7

    .line 1444
    goto :goto_ca

    .line 1448
    .end local v4    # "readMethod":Ljava/lang/reflect/Method;
    :catch_d9
    move-exception v1

    .line 1449
    .local v1, "e":Ljava/lang/IllegalAccessException;
    goto :goto_7b

    .line 1450
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_db
    move-exception v1

    .line 1451
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_7b

    .line 1452
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_dd
    move-exception v1

    .line 1453
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_7b
.end method

.method public isWriteable(Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 11
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1478
    if-nez p1, :cond_c

    .line 1479
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "No bean specified"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1481
    :cond_c
    if-nez p2, :cond_38

    .line 1482
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "No name specified for bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1504
    .local v2, "nestedBean":Ljava/lang/Object;
    .local v3, "next":Ljava/lang/String;
    :cond_31
    move-object p1, v2

    .line 1505
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1487
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_38
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_80

    .line 1488
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1489
    .restart local v3    # "next":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1491
    .restart local v2    # "nestedBean":Ljava/lang/Object;
    :try_start_47
    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4a
    .catch Ljava/lang/IllegalAccessException; {:try_start_47 .. :try_end_4a} :catch_7a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_47 .. :try_end_4a} :catch_7c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_47 .. :try_end_4a} :catch_7e

    move-result-object v2

    .line 1499
    if-nez v2, :cond_31

    .line 1500
    new-instance v5, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Null property value for \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' on bean class \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1492
    :catch_7a
    move-exception v1

    .line 1544
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_7b
    :goto_7b
    return v7

    .line 1494
    .restart local v2    # "nestedBean":Ljava/lang/Object;
    .restart local v3    # "next":Ljava/lang/String;
    :catch_7c
    move-exception v1

    .line 1495
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_7b

    .line 1496
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_7e
    move-exception v1

    .line 1497
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_7b

    .line 1509
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "nestedBean":Ljava/lang/Object;
    .end local v3    # "next":Ljava/lang/String;
    :cond_80
    iget-object v5, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1513
    instance-of v5, p1, Lorg/apache/commons/beanutils/WrapDynaBean;

    if-eqz v5, :cond_90

    .line 1514
    check-cast p1, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object p1

    .line 1518
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_90
    instance-of v5, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_a6

    move-object v5, p1

    .line 1520
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v5

    if-eqz v5, :cond_a4

    move v5, v6

    :goto_a2
    move v7, v5

    goto :goto_7b

    :cond_a4
    move v5, v7

    goto :goto_a2

    .line 1523
    :cond_a6
    :try_start_a6
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1525
    .local v0, "desc":Ljava/beans/PropertyDescriptor;
    if-eqz v0, :cond_7b

    .line 1526
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0, v5, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getWriteMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1527
    .local v4, "writeMethod":Ljava/lang/reflect/Method;
    if-nez v4, :cond_c8

    .line 1528
    instance-of v5, v0, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v5, :cond_cc

    .line 1529
    check-cast v0, Ljava/beans/IndexedPropertyDescriptor;

    .end local v0    # "desc":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1533
    :cond_c0
    :goto_c0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1535
    :cond_c8
    if-eqz v4, :cond_d7

    :goto_ca
    move v7, v6

    goto :goto_7b

    .line 1530
    .restart local v0    # "desc":Ljava/beans/PropertyDescriptor;
    :cond_cc
    instance-of v5, v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    if-eqz v5, :cond_c0

    .line 1531
    check-cast v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v0    # "desc":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedWriteMethod()Ljava/lang/reflect/Method;
    :try_end_d5
    .catch Ljava/lang/IllegalAccessException; {:try_start_a6 .. :try_end_d5} :catch_d9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_a6 .. :try_end_d5} :catch_db
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a6 .. :try_end_d5} :catch_dd

    move-result-object v4

    goto :goto_c0

    :cond_d7
    move v6, v7

    .line 1535
    goto :goto_ca

    .line 1539
    .end local v4    # "writeMethod":Ljava/lang/reflect/Method;
    :catch_d9
    move-exception v1

    .line 1540
    .local v1, "e":Ljava/lang/IllegalAccessException;
    goto :goto_7b

    .line 1541
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_db
    move-exception v1

    .line 1542
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    goto :goto_7b

    .line 1543
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_dd
    move-exception v1

    .line 1544
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_7b
.end method

.method public setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V
    .registers 15
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "index"    # I
    .param p4, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1638
    if-nez p1, :cond_a

    .line 1639
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "No bean specified"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1641
    :cond_a
    if-eqz p2, :cond_12

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_2a

    .line 1642
    :cond_12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_20

    .line 1643
    invoke-static {p1, p3, p4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 1730
    .end local p1    # "bean":Ljava/lang/Object;
    :goto_1f
    return-void

    .line 1645
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_20
    instance-of v7, p1, Ljava/util/List;

    if-eqz v7, :cond_2a

    .line 1646
    check-cast p1, Ljava/util/List;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1650
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_2a
    if-nez p2, :cond_4f

    .line 1651
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "No name specified for bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1656
    :cond_4f
    instance-of v7, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v7, :cond_93

    move-object v7, p1

    .line 1657
    check-cast v7, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v7}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v7

    invoke-interface {v7, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 1659
    .local v1, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v1, :cond_8d

    .line 1660
    new-instance v7, Ljava/lang/NoSuchMethodException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unknown property \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' on bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1663
    :cond_8d
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2, p3, p4}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;ILjava/lang/Object;)V

    goto :goto_1f

    .line 1668
    .end local v1    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_93
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v1

    .line 1670
    .local v1, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v1, :cond_c6

    .line 1671
    new-instance v7, Ljava/lang/NoSuchMethodException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unknown property \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' on bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1676
    :cond_c6
    instance-of v7, v1, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v7, :cond_150

    move-object v7, v1

    .line 1677
    check-cast v7, Ljava/beans/IndexedPropertyDescriptor;

    invoke-virtual {v7}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v6

    .line 1679
    .local v6, "writeMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-static {v7, v6}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 1680
    if-eqz v6, :cond_150

    .line 1681
    const/4 v7, 0x2

    new-array v4, v7, [Ljava/lang/Object;

    .line 1682
    .local v4, "subscript":[Ljava/lang/Object;
    const/4 v7, 0x0

    new-instance v8, Ljava/lang/Integer;

    invoke-direct {v8, p3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v8, v4, v7

    .line 1683
    const/4 v7, 0x1

    aput-object p4, v4, v7

    .line 1685
    :try_start_e9
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v7}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v7

    if-eqz v7, :cond_131

    .line 1686
    if-nez p4, :cond_146

    const-string v5, "<null>"

    .line 1689
    .local v5, "valueClassName":Ljava/lang/String;
    :goto_f5
    iget-object v7, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "setSimpleProperty: Invoking method "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " with index="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ", value="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, " (class "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ")"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 1694
    .end local v5    # "valueClassName":Ljava/lang/String;
    :cond_131
    invoke-direct {p0, v6, p1, v4}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_134
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_e9 .. :try_end_134} :catch_136

    goto/16 :goto_1f

    .line 1695
    :catch_136
    move-exception v2

    .line 1696
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v7

    instance-of v7, v7, Ljava/lang/IndexOutOfBoundsException;

    if-eqz v7, :cond_14f

    .line 1698
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v7

    check-cast v7, Ljava/lang/IndexOutOfBoundsException;

    throw v7

    .line 1686
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_146
    :try_start_146
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;
    :try_end_14d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_146 .. :try_end_14d} :catch_136

    move-result-object v5

    goto :goto_f5

    .line 1701
    .restart local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_14f
    throw v2

    .line 1709
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v4    # "subscript":[Ljava/lang/Object;
    .end local v6    # "writeMethod":Ljava/lang/reflect/Method;
    :cond_150
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1710
    .local v3, "readMethod":Ljava/lang/reflect/Method;
    if-nez v3, :cond_187

    .line 1711
    new-instance v7, Ljava/lang/NoSuchMethodException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Property \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' has no getter method on bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1716
    :cond_187
    sget-object v7, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-direct {p0, v3, p1, v7}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1717
    .local v0, "array":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-nez v7, :cond_1cf

    .line 1718
    instance-of v7, v0, Ljava/util/List;

    if-eqz v7, :cond_1a2

    .line 1720
    check-cast v0, Ljava/util/List;

    .end local v0    # "array":Ljava/lang/Object;
    invoke-interface {v0, p3, p4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1f

    .line 1722
    .restart local v0    # "array":Ljava/lang/Object;
    :cond_1a2
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Property \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\' is not indexed on bean class \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1727
    :cond_1cf
    invoke-static {v0, p3, p4}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    goto/16 :goto_1f
.end method

.method public setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1581
    if-nez p1, :cond_a

    .line 1582
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1584
    :cond_a
    if-nez p2, :cond_2f

    .line 1585
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1590
    :cond_2f
    const/4 v1, -0x1

    .line 1592
    .local v1, "index":I
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getIndex(Ljava/lang/String;)I
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_35} :catch_65

    move-result v1

    .line 1597
    if-gez v1, :cond_93

    .line 1598
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid indexed property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1593
    :catch_65
    move-exception v0

    .line 1594
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid indexed property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1603
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_93
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1606
    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V

    .line 1608
    return-void
.end method

.method public setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1757
    if-nez p1, :cond_a

    .line 1758
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1760
    :cond_a
    if-nez p2, :cond_2f

    .line 1761
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1766
    :cond_2f
    const/4 v1, 0x0

    .line 1768
    .local v1, "key":Ljava/lang/String;
    :try_start_30
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;
    :try_end_35
    .catch Ljava/lang/IllegalArgumentException; {:try_start_30 .. :try_end_35} :catch_65

    move-result-object v1

    .line 1774
    if-nez v1, :cond_93

    .line 1775
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid mapped property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1769
    :catch_65
    move-exception v0

    .line 1770
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid mapped property \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1781
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_93
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1784
    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1786
    return-void
.end method

.method public setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 14
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1810
    if-nez p1, :cond_a

    .line 1811
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "No bean specified"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1813
    :cond_a
    if-nez p2, :cond_2f

    .line 1814
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "No name specified for bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1817
    :cond_2f
    if-nez p3, :cond_5e

    .line 1818
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "No key specified for property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\' on bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1823
    :cond_5e
    instance-of v6, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v6, :cond_a2

    move-object v6, p1

    .line 1824
    check-cast v6, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v6}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v6

    invoke-interface {v6, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 1826
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_9c

    .line 1827
    new-instance v6, Ljava/lang/NoSuchMethodException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Unknown property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\' on bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1830
    :cond_9c
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2, p3, p4}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1882
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_a1
    :goto_a1
    return-void

    .line 1835
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_a2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 1837
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_d5

    .line 1838
    new-instance v6, Ljava/lang/NoSuchMethodException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Unknown property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\' on bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1842
    :cond_d5
    instance-of v6, v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    if-eqz v6, :cond_17b

    .line 1844
    check-cast v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;

    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    .line 1847
    .local v2, "mappedWriteMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, v2}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 1848
    if-eqz v2, :cond_148

    .line 1849
    const/4 v6, 0x2

    new-array v3, v6, [Ljava/lang/Object;

    .line 1850
    .local v3, "params":[Ljava/lang/Object;
    const/4 v6, 0x0

    aput-object p3, v3, v6

    .line 1851
    const/4 v6, 0x1

    aput-object p4, v3, v6

    .line 1852
    iget-object v6, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v6

    if-eqz v6, :cond_13a

    .line 1853
    if-nez p4, :cond_13f

    const-string v5, "<null>"

    .line 1855
    .local v5, "valueClassName":Ljava/lang/String;
    :goto_fe
    iget-object v6, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "setSimpleProperty: Invoking method "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " with key="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, ", value="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " (class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 1860
    .end local v5    # "valueClassName":Ljava/lang/String;
    :cond_13a
    invoke-direct {p0, v2, p1, v3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_a1

    .line 1853
    :cond_13f
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    goto :goto_fe

    .line 1862
    .end local v3    # "params":[Ljava/lang/Object;
    :cond_148
    new-instance v6, Ljava/lang/NoSuchMethodException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\' has no mapped setter method"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "on bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1868
    .end local v2    # "mappedWriteMethod":Ljava/lang/reflect/Method;
    .restart local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    :cond_17b
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p0, v6, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getReadMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1869
    .local v4, "readMethod":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_196

    .line 1870
    sget-object v6, Lorg/apache/commons/beanutils/PropertyUtilsBean;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    invoke-direct {p0, v4, p1, v6}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 1872
    .local v1, "invokeResult":Ljava/lang/Object;
    instance-of v6, v1, Ljava/util/Map;

    if-eqz v6, :cond_a1

    .line 1873
    check-cast v1, Ljava/util/Map;

    .end local v1    # "invokeResult":Ljava/lang/Object;
    invoke-interface {v1, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_a1

    .line 1876
    :cond_196
    new-instance v6, Ljava/lang/NoSuchMethodException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\' has no mapped getter method on bean class \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public setNestedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1920
    if-nez p1, :cond_a

    .line 1921
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "No bean specified"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1923
    :cond_a
    if-nez p2, :cond_36

    .line 1924
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No name specified for bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1946
    .local v0, "nestedBean":Ljava/lang/Object;
    .local v1, "next":Ljava/lang/String;
    :cond_2f
    move-object p1, v0

    .line 1947
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->remove(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 1929
    .end local v0    # "nestedBean":Ljava/lang/Object;
    .end local v1    # "next":Ljava/lang/String;
    :cond_36
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9e

    .line 1930
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->next(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1931
    .restart local v1    # "next":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1932
    .restart local v0    # "nestedBean":Ljava/lang/Object;
    instance-of v2, p1, Ljava/util/Map;

    if-eqz v2, :cond_7f

    move-object v2, p1

    .line 1933
    check-cast v2, Ljava/util/Map;

    invoke-virtual {p0, v2, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1941
    :goto_50
    if-nez v0, :cond_2f

    .line 1942
    new-instance v2, Lorg/apache/commons/beanutils/NestedNullException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Null property value for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' on bean class \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/NestedNullException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1934
    :cond_7f
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, v1}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 1935
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 1936
    :cond_8c
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, v1}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_99

    .line 1937
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 1939
    :cond_99
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_50

    .line 1950
    .end local v0    # "nestedBean":Ljava/lang/Object;
    .end local v1    # "next":Ljava/lang/String;
    :cond_9e
    instance-of v2, p1, Ljava/util/Map;

    if-eqz v2, :cond_a8

    .line 1951
    check-cast p1, Ljava/util/Map;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)V

    .line 1960
    :goto_a7
    return-void

    .line 1952
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_a8
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b4

    .line 1953
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a7

    .line 1954
    :cond_b4
    iget-object v2, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v2, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c0

    .line 1955
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a7

    .line 1957
    :cond_c0
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_a7
.end method

.method public setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 2064
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->setNestedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2066
    return-void
.end method

.method protected setPropertyOfMapBean(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8
    .param p1, "bean"    # Ljava/util/Map;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 2022
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 2023
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2024
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1c

    .line 2025
    :cond_16
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 2029
    .end local v0    # "name":Ljava/lang/String;
    :cond_1c
    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2c

    iget-object v1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v1, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 2031
    :cond_2c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Indexed or mapped properties are not supported on objects of type Map: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2036
    :cond_45
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2037
    return-void
.end method

.method public setResolver(Lorg/apache/commons/beanutils/expression/Resolver;)V
    .registers 3
    .param p1, "resolver"    # Lorg/apache/commons/beanutils/expression/Resolver;

    .prologue
    .line 179
    if-nez p1, :cond_a

    .line 180
    new-instance v0, Lorg/apache/commons/beanutils/expression/DefaultResolver;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/expression/DefaultResolver;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    .line 184
    :goto_9
    return-void

    .line 182
    :cond_a
    iput-object p1, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    goto :goto_9
.end method

.method public setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 11
    .param p1, "bean"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 2093
    if-nez p1, :cond_a

    .line 2094
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "No bean specified"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2096
    :cond_a
    if-nez p2, :cond_2f

    .line 2097
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "No name specified for bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2102
    :cond_2f
    iget-object v4, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v4, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->hasNested(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_64

    .line 2103
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Nested property names are not allowed: Property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2106
    :cond_64
    iget-object v4, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v4, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isIndexed(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_99

    .line 2107
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Indexed property names are not allowed: Property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2110
    :cond_99
    iget-object v4, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->resolver:Lorg/apache/commons/beanutils/expression/Resolver;

    invoke-interface {v4, p2}, Lorg/apache/commons/beanutils/expression/Resolver;->isMapped(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ce

    .line 2111
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Mapped property names are not allowed: Property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on bean class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2117
    :cond_ce
    instance-of v4, p1, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v4, :cond_114

    move-object v4, p1

    .line 2118
    check-cast v4, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v4}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    invoke-interface {v4, p2}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 2120
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_10e

    .line 2121
    new-instance v4, Ljava/lang/NoSuchMethodException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unknown property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on dynaclass \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2125
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_10e
    check-cast p1, Lorg/apache/commons/beanutils/DynaBean;

    .end local p1    # "bean":Ljava/lang/Object;
    invoke-interface {p1, p2, p3}, Lorg/apache/commons/beanutils/DynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2153
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :goto_113
    return-void

    .line 2130
    .restart local p1    # "bean":Ljava/lang/Object;
    :cond_114
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v0

    .line 2132
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    if-nez v0, :cond_147

    .line 2133
    new-instance v4, Ljava/lang/NoSuchMethodException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unknown property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' on class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2136
    :cond_147
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p0, v4, v0}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->getWriteMethod(Ljava/lang/Class;Ljava/beans/PropertyDescriptor;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 2137
    .local v3, "writeMethod":Ljava/lang/reflect/Method;
    if-nez v3, :cond_17e

    .line 2138
    new-instance v4, Ljava/lang/NoSuchMethodException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' has no setter method in class \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2143
    :cond_17e
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/Object;

    .line 2144
    .local v2, "values":[Ljava/lang/Object;
    const/4 v4, 0x0

    aput-object p3, v2, v4

    .line 2145
    iget-object v4, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v4

    if-eqz v4, :cond_1c2

    .line 2146
    if-nez p3, :cond_1c7

    const-string v1, "<null>"

    .line 2148
    .local v1, "valueClassName":Ljava/lang/String;
    :goto_190
    iget-object v4, p0, Lorg/apache/commons/beanutils/PropertyUtilsBean;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "setSimpleProperty: Invoking method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " with value "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " (class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 2151
    .end local v1    # "valueClassName":Ljava/lang/String;
    :cond_1c2
    invoke-direct {p0, v3, p1, v2}, Lorg/apache/commons/beanutils/PropertyUtilsBean;->invokeMethod(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_113

    .line 2146
    :cond_1c7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_190
.end method
