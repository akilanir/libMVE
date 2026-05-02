.class public Lfreemarker/ext/beans/BeanModel;
.super Ljava/lang/Object;
.source "BeanModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;
.implements Lfreemarker/template/AdapterTemplateModel;
.implements Lfreemarker/ext/util/WrapperTemplateModel;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;

.field static final UNKNOWN:Lfreemarker/template/TemplateModel;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private memberMap:Ljava/util/HashMap;

.field protected final object:Ljava/lang/Object;

.field protected final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 98
    const-string v0, "freemarker.beans"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeanModel;->logger:Lfreemarker/log/Logger;

    .line 103
    new-instance v0, Lfreemarker/template/SimpleScalar;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    .line 105
    new-instance v0, Lfreemarker/ext/beans/BeanModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/BeanModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/BeanModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object p1, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    .line 135
    iput-object p2, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 136
    if-eqz p1, :cond_10

    .line 137
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p2, v0}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    .line 139
    :cond_10
    return-void
.end method

.method private invokeThroughDescriptor(Ljava/lang/Object;Ljava/util/Map;)Lfreemarker/template/TemplateModel;
    .registers 12
    .param p1, "desc"    # Ljava/lang/Object;
    .param p2, "classInfo"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 251
    monitor-enter p0

    .line 252
    :try_start_1
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->memberMap:Ljava/util/HashMap;

    if-eqz v5, :cond_12

    .line 253
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->memberMap:Ljava/util/HashMap;

    invoke-virtual {v5, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 258
    .local v0, "member":Lfreemarker/template/TemplateModel;
    :goto_d
    monitor-exit p0

    .line 260
    if-eqz v0, :cond_17

    move-object v4, v0

    .line 304
    :cond_11
    :goto_11
    return-object v4

    .line 256
    .end local v0    # "member":Lfreemarker/template/TemplateModel;
    :cond_12
    const/4 v0, 0x0

    .restart local v0    # "member":Lfreemarker/template/TemplateModel;
    goto :goto_d

    .line 258
    .end local v0    # "member":Lfreemarker/template/TemplateModel;
    :catchall_14
    move-exception v5

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v5

    .line 263
    .restart local v0    # "member":Lfreemarker/template/TemplateModel;
    :cond_17
    sget-object v4, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    .line 264
    .local v4, "retval":Lfreemarker/template/TemplateModel;
    instance-of v5, p1, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v5, :cond_4a

    move-object v5, p1

    .line 266
    check-cast v5, Ljava/beans/IndexedPropertyDescriptor;

    invoke-virtual {v5}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 268
    .local v3, "readMethod":Ljava/lang/reflect/Method;
    new-instance v0, Lfreemarker/ext/beans/SimpleMethodModel;

    .end local v0    # "member":Lfreemarker/template/TemplateModel;
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-static {p2, v3}, Lfreemarker/ext/beans/BeansWrapper;->getArgTypes(Ljava/util/Map;Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/Class;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v0, v5, v3, v6, v7}, Lfreemarker/ext/beans/SimpleMethodModel;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Class;Lfreemarker/ext/beans/BeansWrapper;)V

    .restart local v0    # "member":Lfreemarker/template/TemplateModel;
    move-object v4, v0

    .line 296
    .end local v3    # "readMethod":Ljava/lang/reflect/Method;
    :cond_32
    :goto_32
    if-eqz v0, :cond_11

    .line 297
    monitor-enter p0

    .line 298
    :try_start_35
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->memberMap:Ljava/util/HashMap;

    if-nez v5, :cond_40

    .line 299
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lfreemarker/ext/beans/BeanModel;->memberMap:Ljava/util/HashMap;

    .line 301
    :cond_40
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->memberMap:Ljava/util/HashMap;

    invoke-virtual {v5, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    monitor-exit p0

    goto :goto_11

    :catchall_47
    move-exception v5

    monitor-exit p0
    :try_end_49
    .catchall {:try_start_35 .. :try_end_49} :catchall_47

    throw v5

    .line 272
    :cond_4a
    instance-of v5, p1, Ljava/beans/PropertyDescriptor;

    if-eqz v5, :cond_5f

    move-object v2, p1

    .line 274
    check-cast v2, Ljava/beans/PropertyDescriptor;

    .line 275
    .local v2, "pd":Ljava/beans/PropertyDescriptor;
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v6, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v7, v8}, Lfreemarker/ext/beans/BeansWrapper;->invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 277
    goto :goto_32

    .line 278
    .end local v2    # "pd":Ljava/beans/PropertyDescriptor;
    :cond_5f
    instance-of v5, p1, Ljava/lang/reflect/Field;

    if-eqz v5, :cond_73

    .line 280
    iget-object v6, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    move-object v5, p1

    check-cast v5, Ljava/lang/reflect/Field;

    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v6, v5}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto :goto_32

    .line 283
    :cond_73
    instance-of v5, p1, Ljava/lang/reflect/Method;

    if-eqz v5, :cond_89

    move-object v1, p1

    .line 285
    check-cast v1, Ljava/lang/reflect/Method;

    .line 286
    .local v1, "method":Ljava/lang/reflect/Method;
    new-instance v0, Lfreemarker/ext/beans/SimpleMethodModel;

    .end local v0    # "member":Lfreemarker/template/TemplateModel;
    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-static {p2, v1}, Lfreemarker/ext/beans/BeansWrapper;->getArgTypes(Ljava/util/Map;Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/Class;

    move-result-object v6

    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v0, v5, v1, v6, v7}, Lfreemarker/ext/beans/SimpleMethodModel;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Class;Lfreemarker/ext/beans/BeansWrapper;)V

    .restart local v0    # "member":Lfreemarker/template/TemplateModel;
    move-object v4, v0

    .line 288
    goto :goto_32

    .line 289
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :cond_89
    instance-of v5, p1, Lfreemarker/ext/beans/OverloadedMethods;

    if-eqz v5, :cond_32

    .line 291
    new-instance v0, Lfreemarker/ext/beans/OverloadedMethodsModel;

    .end local v0    # "member":Lfreemarker/template/TemplateModel;
    iget-object v6, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Lfreemarker/ext/beans/OverloadedMethods;

    invoke-direct {v0, v6, v5}, Lfreemarker/ext/beans/OverloadedMethodsModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/OverloadedMethods;)V

    .restart local v0    # "member":Lfreemarker/template/TemplateModel;
    move-object v4, v0

    goto :goto_32
.end method

.method private logNoSuchKey(Ljava/lang/String;Ljava/util/Map;)V
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "keyMap"    # Ljava/util/Map;

    .prologue
    .line 229
    sget-object v0, Lfreemarker/ext/beans/BeanModel;->logger:Lfreemarker/log/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Key "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " was not found on instance of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ". Introspection information for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "the class is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 232
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 12
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 172
    .local v1, "clazz":Ljava/lang/Class;
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v7, v1}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 173
    .local v0, "classInfo":Ljava/util/Map;
    const/4 v6, 0x0

    .line 177
    .local v6, "retval":Lfreemarker/template/TemplateModel;
    :try_start_d
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v7}, Lfreemarker/ext/beans/BeansWrapper;->isMethodsShadowItems()Z

    move-result v7

    if-eqz v7, :cond_4b

    .line 179
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 180
    .local v3, "fd":Ljava/lang/Object;
    if-eqz v3, :cond_46

    .line 182
    invoke-direct {p0, v3, v0}, Lfreemarker/ext/beans/BeanModel;->invokeThroughDescriptor(Ljava/lang/Object;Ljava/util/Map;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 206
    :cond_1f
    :goto_1f
    sget-object v7, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    if-ne v6, v7, :cond_81

    .line 207
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v7}, Lfreemarker/ext/beans/BeansWrapper;->isStrict()Z

    move-result v7

    if-eqz v7, :cond_6f

    .line 208
    new-instance v7, Lfreemarker/ext/beans/InvalidPropertyException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "No such bean property: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lfreemarker/ext/beans/InvalidPropertyException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_44
    .catch Lfreemarker/template/TemplateModelException; {:try_start_d .. :try_end_44} :catch_44
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_44} :catch_83

    .line 216
    .end local v3    # "fd":Ljava/lang/Object;
    :catch_44
    move-exception v2

    .line 218
    .local v2, "e":Lfreemarker/template/TemplateModelException;
    throw v2

    .line 184
    .end local v2    # "e":Lfreemarker/template/TemplateModelException;
    .restart local v3    # "fd":Ljava/lang/Object;
    :cond_46
    :try_start_46
    invoke-virtual {p0, v0, v1, p1}, Lfreemarker/ext/beans/BeanModel;->invokeGenericGet(Ljava/util/Map;Ljava/lang/Class;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    goto :goto_1f

    .line 189
    .end local v3    # "fd":Ljava/lang/Object;
    :cond_4b
    invoke-virtual {p0, v0, v1, p1}, Lfreemarker/ext/beans/BeanModel;->invokeGenericGet(Ljava/util/Map;Ljava/lang/Class;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 190
    .local v4, "model":Lfreemarker/template/TemplateModel;
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 191
    .local v5, "nullModel":Lfreemarker/template/TemplateModel;
    if-eq v4, v5, :cond_5d

    sget-object v7, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    if-eq v4, v7, :cond_5d

    .line 214
    .end local v4    # "model":Lfreemarker/template/TemplateModel;
    .end local v5    # "nullModel":Lfreemarker/template/TemplateModel;
    :goto_5c
    return-object v4

    .line 195
    .restart local v4    # "model":Lfreemarker/template/TemplateModel;
    .restart local v5    # "nullModel":Lfreemarker/template/TemplateModel;
    :cond_5d
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 196
    .restart local v3    # "fd":Ljava/lang/Object;
    if-eqz v3, :cond_1f

    .line 197
    invoke-direct {p0, v3, v0}, Lfreemarker/ext/beans/BeanModel;->invokeThroughDescriptor(Ljava/lang/Object;Ljava/util/Map;)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 198
    sget-object v7, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    if-ne v6, v7, :cond_1f

    if-ne v4, v5, :cond_1f

    .line 202
    move-object v6, v5

    goto :goto_1f

    .line 209
    .end local v4    # "model":Lfreemarker/template/TemplateModel;
    .end local v5    # "nullModel":Lfreemarker/template/TemplateModel;
    :cond_6f
    sget-object v7, Lfreemarker/ext/beans/BeanModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v7}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v7

    if-eqz v7, :cond_7a

    .line 210
    invoke-direct {p0, p1, v0}, Lfreemarker/ext/beans/BeanModel;->logNoSuchKey(Ljava/lang/String;Ljava/util/Map;)V

    .line 212
    :cond_7a
    iget-object v7, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lfreemarker/ext/beans/BeansWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_80
    .catch Lfreemarker/template/TemplateModelException; {:try_start_46 .. :try_end_80} :catch_44
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_80} :catch_83

    move-result-object v6

    :cond_81
    move-object v4, v6

    .line 214
    goto :goto_5c

    .line 220
    .end local v3    # "fd":Ljava/lang/Object;
    :catch_83
    move-exception v2

    .line 222
    .local v2, "e":Ljava/lang/Exception;
    new-instance v7, Lfreemarker/template/TemplateModelException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "get("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ") failed on "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "instance of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ". See cause exception."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7
.end method

.method public getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "hint"    # Ljava/lang/Class;

    .prologue
    .line 352
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    return-object v0
.end method

.method getAsClassicCompatibleString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 387
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    if-nez v0, :cond_7

    const-string v0, "null"

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getWrappedObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 356
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    return-object v0
.end method

.method protected hasPlainGetMethod()Z
    .registers 3

    .prologue
    .line 239
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v1, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method protected invokeGenericGet(Ljava/util/Map;Ljava/lang/Class;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "keyMap"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 313
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 314
    .local v0, "genericGet":Ljava/lang/reflect/Method;
    if-nez v0, :cond_d

    .line 315
    sget-object v1, Lfreemarker/ext/beans/BeanModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    .line 317
    :goto_c
    return-object v1

    :cond_d
    iget-object v1, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v2, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-virtual {v1, v2, v0, v3}, Lfreemarker/ext/beans/BeansWrapper;->invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_c
.end method

.method public isEmpty()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 339
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_16

    .line 340
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_14

    move v0, v1

    .line 348
    :goto_13
    return v0

    :cond_14
    move v0, v2

    .line 340
    goto :goto_13

    .line 342
    :cond_16
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    instance-of v0, v0, Ljava/util/Collection;

    if-eqz v0, :cond_25

    .line 343
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    goto :goto_13

    .line 345
    :cond_25
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    instance-of v0, v0, Ljava/util/Map;

    if-eqz v0, :cond_34

    .line 346
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    goto :goto_13

    .line 348
    :cond_34
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    if-eqz v0, :cond_42

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v3, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_43

    :cond_42
    move v2, v1

    :cond_43
    move v0, v2

    goto :goto_13
.end method

.method protected keySet()Ljava/util/Set;
    .registers 3

    .prologue
    .line 402
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v1, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->keySet(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 5

    .prologue
    .line 366
    new-instance v0, Lfreemarker/core/CollectionAndSequence;

    new-instance v1, Lfreemarker/template/SimpleSequence;

    invoke-virtual {p0}, Lfreemarker/ext/beans/BeanModel;->keySet()Ljava/util/Set;

    move-result-object v2

    iget-object v3, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v1, v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    invoke-direct {v0, v1}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    return-object v0
.end method

.method public size()I
    .registers 3

    .prologue
    .line 361
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v1, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->keyCount(Ljava/lang/Class;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 391
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->object:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    .registers 3
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 371
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lfreemarker/ext/beans/BeanModel;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 372
    .local v2, "values":Ljava/util/List;
    invoke-virtual {p0}, Lfreemarker/ext/beans/BeanModel;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v3

    invoke-interface {v3}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 373
    .local v0, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_11
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    .line 374
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/BeanModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 377
    .end local v1    # "key":Ljava/lang/String;
    :cond_29
    new-instance v3, Lfreemarker/core/CollectionAndSequence;

    new-instance v4, Lfreemarker/template/SimpleSequence;

    iget-object v5, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v4, v2, v5}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    invoke-direct {v3, v4}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    return-object v3
.end method

.method protected wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 323
    iget-object v0, p0, Lfreemarker/ext/beans/BeanModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    invoke-interface {v0, p1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method
