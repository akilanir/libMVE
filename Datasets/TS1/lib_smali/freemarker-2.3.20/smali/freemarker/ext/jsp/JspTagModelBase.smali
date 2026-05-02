.class Lfreemarker/ext/jsp/JspTagModelBase;
.super Ljava/lang/Object;
.source "JspTagModelBase.java"


# static fields
.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field private final dynaSetter:Ljava/lang/reflect/Method;

.field private final propertySetters:Ljava/util/Map;

.field private final tagClass:Ljava/lang/Class;


# direct methods
.method protected constructor <init>(Ljava/lang/Class;)V
    .registers 13
    .param p1, "tagClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Lfreemarker/ext/jsp/JspTagModelBase;->propertySetters:Ljava/util/Map;

    .line 27
    iput-object p1, p0, Lfreemarker/ext/jsp/JspTagModelBase;->tagClass:Ljava/lang/Class;

    .line 28
    invoke-static {p1}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;

    move-result-object v0

    .line 29
    .local v0, "bi":Ljava/beans/BeanInfo;
    invoke-interface {v0}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;

    move-result-object v6

    .line 30
    .local v6, "pda":[Ljava/beans/PropertyDescriptor;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_15
    array-length v7, v6

    if-ge v2, v7, :cond_2c

    .line 31
    aget-object v5, v6, v2

    .line 32
    .local v5, "pd":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 33
    .local v3, "m":Ljava/lang/reflect/Method;
    if-eqz v3, :cond_29

    .line 34
    iget-object v7, p0, Lfreemarker/ext/jsp/JspTagModelBase;->propertySetters:Ljava/util/Map;

    invoke-virtual {v5}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 41
    .end local v3    # "m":Ljava/lang/reflect/Method;
    .end local v5    # "pd":Ljava/beans/PropertyDescriptor;
    :cond_2c
    :try_start_2c
    const-string v8, "setDynamicAttribute"

    const/4 v7, 0x3

    new-array v9, v7, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_65

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lfreemarker/ext/jsp/JspTagModelBase;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    :goto_3e
    aput-object v7, v9, v10

    const/4 v10, 0x1

    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    if-nez v7, :cond_68

    const-string v7, "java.lang.String"

    invoke-static {v7}, Lfreemarker/ext/jsp/JspTagModelBase;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    :goto_4d
    aput-object v7, v9, v10

    const/4 v10, 0x2

    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v7, :cond_6b

    const-string v7, "java.lang.Object"

    invoke-static {v7}, Lfreemarker/ext/jsp/JspTagModelBase;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$Object:Ljava/lang/Class;

    :goto_5c
    aput-object v7, v9, v10

    invoke-virtual {p1, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_61
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2c .. :try_end_61} :catch_6e

    move-result-object v1

    .line 47
    .local v1, "dynaSetter":Ljava/lang/reflect/Method;
    :goto_62
    iput-object v1, p0, Lfreemarker/ext/jsp/JspTagModelBase;->dynaSetter:Ljava/lang/reflect/Method;

    .line 48
    return-void

    .line 41
    .end local v1    # "dynaSetter":Ljava/lang/reflect/Method;
    :cond_65
    :try_start_65
    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_3e

    :cond_68
    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_4d

    :cond_6b
    sget-object v7, Lfreemarker/ext/jsp/JspTagModelBase;->class$java$lang$Object:Ljava/lang/Class;
    :try_end_6d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_65 .. :try_end_6d} :catch_6e

    goto :goto_5c

    .line 44
    :catch_6e
    move-exception v4

    .line 45
    .local v4, "nsme":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    .restart local v1    # "dynaSetter":Ljava/lang/reflect/Method;
    goto :goto_62
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 42
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


# virtual methods
.method getTagInstance()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lfreemarker/ext/jsp/JspTagModelBase;->tagClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method setupTag(Ljava/lang/Object;Ljava/util/Map;Lfreemarker/template/ObjectWrapper;)V
    .registers 16
    .param p1, "tag"    # Ljava/lang/Object;
    .param p2, "args"    # Ljava/util/Map;
    .param p3, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 60
    instance-of v6, p3, Lfreemarker/ext/beans/BeansWrapper;

    if-eqz v6, :cond_7a

    check-cast p3, Lfreemarker/ext/beans/BeansWrapper;

    .end local p3    # "wrapper":Lfreemarker/template/ObjectWrapper;
    move-object v2, p3

    .line 64
    .local v2, "bwrapper":Lfreemarker/ext/beans/BeansWrapper;
    :goto_9
    if-eqz p2, :cond_ad

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_ad

    .line 65
    new-array v0, v11, [Ljava/lang/Object;

    .line 66
    .local v0, "aarg":[Ljava/lang/Object;
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "iter":Ljava/util/Iterator;
    :goto_1b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ad

    .line 68
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 69
    .local v3, "entry":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    invoke-virtual {v2, v6}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v1

    .line 70
    .local v1, "arg":Ljava/lang/Object;
    aput-object v1, v0, v10

    .line 71
    iget-object v6, p0, Lfreemarker/ext/jsp/JspTagModelBase;->propertySetters:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Method;

    .line 72
    .local v5, "m":Ljava/lang/reflect/Method;
    if-nez v5, :cond_96

    .line 73
    iget-object v6, p0, Lfreemarker/ext/jsp/JspTagModelBase;->dynaSetter:Ljava/lang/reflect/Method;

    if-nez v6, :cond_7f

    .line 74
    new-instance v6, Lfreemarker/template/TemplateModelException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Unknown property "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " on instance of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/jsp/JspTagModelBase;->tagClass:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 60
    .end local v0    # "aarg":[Ljava/lang/Object;
    .end local v1    # "arg":Ljava/lang/Object;
    .end local v2    # "bwrapper":Lfreemarker/ext/beans/BeansWrapper;
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "m":Ljava/lang/reflect/Method;
    .restart local p3    # "wrapper":Lfreemarker/template/ObjectWrapper;
    :cond_7a
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v2

    goto :goto_9

    .line 79
    .end local p3    # "wrapper":Lfreemarker/template/ObjectWrapper;
    .restart local v0    # "aarg":[Ljava/lang/Object;
    .restart local v1    # "arg":Ljava/lang/Object;
    .restart local v2    # "bwrapper":Lfreemarker/ext/beans/BeansWrapper;
    .restart local v3    # "entry":Ljava/util/Map$Entry;
    .restart local v4    # "iter":Ljava/util/Iterator;
    .restart local v5    # "m":Ljava/lang/reflect/Method;
    :cond_7f
    iget-object v6, p0, Lfreemarker/ext/jsp/JspTagModelBase;->dynaSetter:Ljava/lang/reflect/Method;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v8, v7, v10

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    aput-object v8, v7, v11

    const/4 v8, 0x2

    aget-object v9, v0, v10

    aput-object v9, v7, v8

    invoke-virtual {v6, p1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1b

    .line 83
    :cond_96
    instance-of v6, v1, Ljava/math/BigDecimal;

    if-eqz v6, :cond_a8

    .line 84
    check-cast v1, Ljava/math/BigDecimal;

    .end local v1    # "arg":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    aget-object v6, v6, v10

    invoke-static {v1, v6}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimal(Ljava/math/BigDecimal;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, v0, v10

    .line 87
    :cond_a8
    invoke-virtual {v5, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1b

    .line 91
    .end local v0    # "aarg":[Ljava/lang/Object;
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "m":Ljava/lang/reflect/Method;
    :cond_ad
    return-void
.end method
