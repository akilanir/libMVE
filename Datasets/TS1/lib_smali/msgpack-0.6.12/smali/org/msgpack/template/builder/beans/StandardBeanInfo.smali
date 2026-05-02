.class Lorg/msgpack/template/builder/beans/StandardBeanInfo;
.super Lorg/msgpack/template/builder/beans/SimpleBeanInfo;
.source "StandardBeanInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/beans/StandardBeanInfo$1;,
        Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;
    }
.end annotation


# static fields
.field private static final PREFIX_ADD:Ljava/lang/String; = "add"

.field private static final PREFIX_GET:Ljava/lang/String; = "get"

.field private static final PREFIX_IS:Ljava/lang/String; = "is"

.field private static final PREFIX_REMOVE:Ljava/lang/String; = "remove"

.field private static final PREFIX_SET:Ljava/lang/String; = "set"

.field private static final STR_GETTERS:Ljava/lang/String; = "getters"

.field private static final STR_INDEXED:Ljava/lang/String; = "indexed"

.field private static final STR_INVALID:Ljava/lang/String; = "invalid"

.field private static final STR_IS_CONSTRAINED:Ljava/lang/String; = "isConstrained"

.field private static final STR_NORMAL:Ljava/lang/String; = "normal"

.field private static final STR_PROPERTY_TYPE:Ljava/lang/String; = "PropertyType"

.field private static final STR_SETTERS:Ljava/lang/String; = "setters"

.field private static final STR_VALID:Ljava/lang/String; = "valid"

.field private static final SUFFIX_LISTEN:Ljava/lang/String; = "Listener"

.field private static comparator:Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;


# instance fields
.field additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

.field private beanClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

.field private canAddPropertyChangeListener:Z

.field private canRemovePropertyChangeListener:Z

.field private defaultEventIndex:I

.field private defaultPropertyIndex:I

.field private events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

.field private explicitBeanInfo:Lorg/msgpack/template/builder/beans/BeanInfo;

.field private explicitEvents:Z

.field private explicitMethods:Z

.field private explicitProperties:Z

.field private methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

.field private properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 89
    new-instance v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;-><init>(Lorg/msgpack/template/builder/beans/StandardBeanInfo$1;)V

    sput-object v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->comparator:Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;

    return-void
.end method

.method constructor <init>(Ljava/lang/Class;Lorg/msgpack/template/builder/beans/BeanInfo;Ljava/lang/Class;)V
    .registers 8
    .param p2, "explicitBeanInfo"    # Lorg/msgpack/template/builder/beans/BeanInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/msgpack/template/builder/beans/BeanInfo;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "stopClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v0, 0x0

    .line 96
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/SimpleBeanInfo;-><init>()V

    .line 65
    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitMethods:Z

    .line 67
    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitProperties:Z

    .line 69
    iput-boolean v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitEvents:Z

    .line 71
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitBeanInfo:Lorg/msgpack/template/builder/beans/BeanInfo;

    .line 73
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 75
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 77
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 79
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    .line 81
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

    .line 85
    iput v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    .line 87
    iput v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    .line 97
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    .line 115
    if-eqz p2, :cond_73

    .line 116
    iput-object p2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitBeanInfo:Lorg/msgpack/template/builder/beans/BeanInfo;

    .line 117
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getEventSetDescriptors()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 118
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getMethodDescriptors()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 119
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 120
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultEventIndex()I

    move-result v0

    iput v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    .line 121
    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    if-ltz v0, :cond_46

    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    array-length v1, v1

    if-lt v0, v1, :cond_48

    .line 122
    :cond_46
    iput v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    .line 124
    :cond_48
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultPropertyIndex()I

    move-result v0

    iput v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    .line 125
    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    if-ltz v0, :cond_59

    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    array-length v1, v1

    if-lt v0, v1, :cond_5b

    .line 127
    :cond_59
    iput v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    .line 129
    :cond_5b
    invoke-interface {p2}, Lorg/msgpack/template/builder/beans/BeanInfo;->getAdditionalBeanInfo()[Lorg/msgpack/template/builder/beans/BeanInfo;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->additionalBeanInfo:[Lorg/msgpack/template/builder/beans/BeanInfo;

    .line 131
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    if-eqz v0, :cond_67

    .line 132
    iput-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitEvents:Z

    .line 133
    :cond_67
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    if-eqz v0, :cond_6d

    .line 134
    iput-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitMethods:Z

    .line 135
    :cond_6d
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    if-eqz v0, :cond_73

    .line 136
    iput-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitProperties:Z

    .line 139
    :cond_73
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    if-nez v0, :cond_7d

    .line 140
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 143
    :cond_7d
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    if-nez v0, :cond_87

    .line 144
    invoke-direct {p0, p3}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectProperties(Ljava/lang/Class;)[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 147
    :cond_87
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    if-nez v0, :cond_91

    .line 148
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectEvents()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 150
    :cond_91
    return-void
.end method

.method private capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 474
    if-nez p1, :cond_6

    .line 475
    const/4 p1, 0x0

    .line 487
    .end local p1    # "name":Ljava/lang/String;
    :cond_5
    :goto_5
    return-object p1

    .line 481
    .restart local p1    # "name":Ljava/lang/String;
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v3, :cond_1c

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-nez v1, :cond_5

    .line 485
    :cond_1c
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 486
    .local v0, "chars":[C
    aget-char v1, v0, v2

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    aput-char v1, v0, v2

    .line 487
    new-instance p1, Ljava/lang/String;

    .end local p1    # "name":Ljava/lang/String;
    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_5
.end method

.method private fixGetSet(Ljava/util/HashMap;)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 950
    .local p1, "propertyTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    if-nez p1, :cond_3

    .line 1280
    :cond_2
    return-void

    .line 954
    :cond_3
    invoke-virtual/range {p1 .. p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_b
    :goto_b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 955
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/HashMap;

    .line 956
    .local v18, "table":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v19, "getters"

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 958
    .local v4, "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    const-string v19, "setters"

    invoke-virtual/range {v18 .. v19}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    .line 961
    .local v17, "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    const/4 v11, 0x0

    .line 962
    .local v11, "normalGetter":Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    .line 963
    .local v7, "indexedGetter":Ljava/lang/reflect/Method;
    const/4 v13, 0x0

    .line 964
    .local v13, "normalSetter":Ljava/lang/reflect/Method;
    const/4 v9, 0x0

    .line 966
    .local v9, "indexedSetter":Ljava/lang/reflect/Method;
    const/4 v12, 0x0

    .line 967
    .local v12, "normalPropType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    .line 969
    .local v8, "indexedPropType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v4, :cond_3a

    .line 970
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 973
    .restart local v4    # "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    :cond_3a
    if-nez v17, :cond_41

    .line 974
    new-instance v17, Ljava/util/ArrayList;

    .end local v17    # "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 978
    .restart local v17    # "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    :cond_41
    const/4 v14, 0x0

    .line 979
    .local v14, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v10, 0x0

    .line 980
    .local v10, "methodName":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_47
    :goto_47
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_ac

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Method;

    .line 981
    .local v3, "getter":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v14

    .line 982
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v10

    .line 984
    if-eqz v14, :cond_62

    array-length v0, v14

    move/from16 v19, v0

    if-nez v19, :cond_6f

    .line 986
    :cond_62
    if-eqz v11, :cond_6e

    const-string v19, "is"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_6f

    .line 988
    :cond_6e
    move-object v11, v3

    .line 993
    :cond_6f
    if-eqz v14, :cond_47

    array-length v0, v14

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_47

    const/16 v19, 0x0

    aget-object v19, v14, v19

    sget-object v20, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_47

    .line 996
    if-eqz v7, :cond_aa

    const-string v19, "get"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_aa

    const-string v19, "is"

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_47

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_47

    .line 1000
    :cond_aa
    move-object v7, v3

    goto :goto_47

    .line 1006
    .end local v3    # "getter":Ljava/lang/reflect/Method;
    :cond_ac
    if-eqz v11, :cond_172

    .line 1008
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v15

    .line 1010
    .local v15, "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_b6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_e5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/reflect/Method;

    .line 1011
    .local v16, "setter":Ljava/lang/reflect/Method;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_b6

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x0

    aget-object v19, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_b6

    .line 1014
    move-object/from16 v13, v16

    .line 1030
    .end local v15    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "setter":Ljava/lang/reflect/Method;
    :cond_e5
    if-eqz v7, :cond_196

    .line 1032
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v15

    .line 1034
    .restart local v15    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_ef
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_12e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/reflect/Method;

    .line 1035
    .restart local v16    # "setter":Ljava/lang/reflect/Method;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_ef

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x0

    aget-object v19, v19, v20

    sget-object v20, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_ef

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v19, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_ef

    .line 1039
    move-object/from16 v9, v16

    .line 1056
    .end local v15    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "setter":Ljava/lang/reflect/Method;
    :cond_12e
    if-eqz v11, :cond_1ca

    .line 1057
    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    .line 1063
    :cond_134
    :goto_134
    if-eqz v7, :cond_1d6

    .line 1064
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    .line 1070
    :cond_13a
    :goto_13a
    if-eqz v11, :cond_146

    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->isArray()Z

    move-result v19

    if-eqz v19, :cond_146

    .line 1081
    :cond_146
    if-eqz v11, :cond_1e2

    if-eqz v13, :cond_1e2

    if-eqz v7, :cond_14e

    if-nez v9, :cond_1e2

    .line 1083
    :cond_14e
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1084
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1085
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1086
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1022
    :cond_172
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_176
    :goto_176
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_e5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/reflect/Method;

    .line 1023
    .restart local v16    # "setter":Ljava/lang/reflect/Method;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_176

    .line 1024
    move-object/from16 v13, v16

    goto :goto_176

    .line 1047
    .end local v16    # "setter":Ljava/lang/reflect/Method;
    :cond_196
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_19a
    :goto_19a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_12e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/reflect/Method;

    .line 1048
    .restart local v16    # "setter":Ljava/lang/reflect/Method;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_19a

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x0

    aget-object v19, v19, v20

    sget-object v20, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_19a

    .line 1050
    move-object/from16 v9, v16

    goto :goto_19a

    .line 1058
    .end local v16    # "setter":Ljava/lang/reflect/Method;
    :cond_1ca
    if-eqz v13, :cond_134

    .line 1059
    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x0

    aget-object v12, v19, v20

    goto/16 :goto_134

    .line 1065
    :cond_1d6
    if-eqz v9, :cond_13a

    .line 1066
    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v8, v19, v20

    goto/16 :goto_13a

    .line 1093
    :cond_1e2
    if-nez v11, :cond_1e6

    if-eqz v13, :cond_20e

    :cond_1e6
    if-nez v7, :cond_20e

    if-nez v9, :cond_20e

    .line 1095
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1096
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1097
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1105
    :cond_20e
    if-nez v11, :cond_212

    if-eqz v13, :cond_4a7

    :cond_212
    if-nez v7, :cond_216

    if-eqz v9, :cond_4a7

    .line 1108
    :cond_216
    if-eqz v11, :cond_2c1

    if-eqz v13, :cond_2c1

    if-eqz v7, :cond_2c1

    if-eqz v9, :cond_2c1

    .line 1110
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_270

    .line 1111
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1113
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1114
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1117
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1118
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1119
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1120
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1123
    :cond_270
    sget-object v19, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v19

    if-eq v12, v0, :cond_29d

    invoke-virtual {v11}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "is"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_29d

    .line 1125
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1127
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1130
    :cond_29d
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1131
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1132
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1141
    :cond_2c1
    if-eqz v11, :cond_31b

    if-nez v13, :cond_31b

    if-eqz v7, :cond_31b

    if-eqz v9, :cond_31b

    .line 1143
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1144
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1145
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1146
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1148
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1149
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_307

    .line 1150
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1152
    :cond_307
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1158
    :cond_31b
    if-nez v11, :cond_353

    if-eqz v13, :cond_353

    if-eqz v7, :cond_353

    if-eqz v9, :cond_353

    .line 1160
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1161
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_33f

    .line 1162
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1164
    :cond_33f
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1165
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1170
    :cond_353
    if-eqz v11, :cond_3d1

    if-nez v13, :cond_3d1

    if-eqz v7, :cond_3d1

    if-nez v9, :cond_3d1

    .line 1172
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_3ad

    .line 1173
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1174
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1175
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1176
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1179
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1180
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1181
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1182
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1185
    :cond_3ad
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1186
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1187
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1188
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1195
    :cond_3d1
    if-nez v11, :cond_44f

    if-eqz v13, :cond_44f

    if-eqz v7, :cond_44f

    if-nez v9, :cond_44f

    .line 1197
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "get"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_42b

    .line 1198
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1199
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1200
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1201
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1204
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1205
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1206
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1207
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1210
    :cond_42b
    const-string v19, "normal"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1211
    const-string v19, "normalget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1212
    const-string v19, "normalset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1213
    const-string v19, "normalPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1220
    :cond_44f
    if-eqz v11, :cond_47b

    if-nez v13, :cond_47b

    if-nez v7, :cond_47b

    if-eqz v9, :cond_47b

    .line 1222
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1223
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1224
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1225
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1230
    :cond_47b
    if-nez v11, :cond_4a7

    if-eqz v13, :cond_4a7

    if-nez v7, :cond_4a7

    if-eqz v9, :cond_4a7

    .line 1232
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1233
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1234
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1235
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1244
    :cond_4a7
    if-nez v13, :cond_4fe

    if-nez v11, :cond_4fe

    if-nez v7, :cond_4af

    if-eqz v9, :cond_4fe

    .line 1246
    :cond_4af
    if-eqz v7, :cond_4da

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v19

    const-string v20, "is"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4da

    .line 1248
    if-eqz v9, :cond_b

    .line 1249
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1250
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1251
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1256
    :cond_4da
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1257
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1258
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1259
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1266
    :cond_4fe
    if-nez v13, :cond_502

    if-eqz v11, :cond_52a

    :cond_502
    if-eqz v7, :cond_52a

    if-eqz v9, :cond_52a

    .line 1268
    const-string v19, "indexed"

    const-string v20, "valid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1269
    const-string v19, "indexedget"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1270
    const-string v19, "indexedset"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1271
    const-string v19, "indexedPropertyType"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b

    .line 1276
    :cond_52a
    const-string v19, "normal"

    const-string v20, "invalid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1277
    const-string v19, "indexed"

    const-string v20, "invalid"

    invoke-virtual/range {v18 .. v20}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_b
.end method

.method private static getQualifiedName(Ljava/lang/reflect/Method;)Ljava/lang/String;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 593
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 594
    .local v2, "qualifiedName":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 595
    .local v1, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    if-eqz v1, :cond_2e

    .line 596
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    array-length v3, v1

    if-ge v0, v3, :cond_2e

    .line 597
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 596
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 600
    .end local v0    # "i":I
    :cond_2e
    return-object v2
.end method

.method private static internalAsMap([Lorg/msgpack/template/builder/beans/EventSetDescriptor;)Ljava/util/HashMap;
    .registers 5
    .param p0, "theDescs"    # [Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/msgpack/template/builder/beans/EventSetDescriptor;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/msgpack/template/builder/beans/EventSetDescriptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 585
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 586
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/EventSetDescriptor;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v2, p0

    if-ge v0, v2, :cond_17

    .line 587
    aget-object v2, p0, v0

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 589
    :cond_17
    return-object v1
.end method

.method private static internalAsMap([Lorg/msgpack/template/builder/beans/MethodDescriptor;)Ljava/util/HashMap;
    .registers 5
    .param p0, "theDescs"    # [Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/msgpack/template/builder/beans/MethodDescriptor;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/msgpack/template/builder/beans/MethodDescriptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 575
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 576
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v3, p0

    if-ge v0, v3, :cond_1b

    .line 577
    aget-object v3, p0, v0

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-static {v3}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->getQualifiedName(Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v2

    .line 578
    .local v2, "qualifiedName":Ljava/lang/String;
    aget-object v3, p0, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 580
    .end local v2    # "qualifiedName":Ljava/lang/String;
    :cond_1b
    return-object v1
.end method

.method private static internalAsMap([Lorg/msgpack/template/builder/beans/PropertyDescriptor;)Ljava/util/HashMap;
    .registers 5
    .param p0, "propertyDescs"    # [Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/msgpack/template/builder/beans/PropertyDescriptor;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/msgpack/template/builder/beans/PropertyDescriptor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 566
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 567
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v2, p0

    if-ge v0, v2, :cond_17

    .line 568
    aget-object v2, p0, v0

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 570
    :cond_17
    return-object v1
.end method

.method private introspectEvents()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 1293
    invoke-direct/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v14

    .line 1295
    .local v14, "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-nez v14, :cond_8

    .line 1296
    const/4 v13, 0x0

    .line 1335
    :goto_7
    return-object v13

    .line 1298
    :cond_8
    new-instance v9, Ljava/util/HashMap;

    array-length v1, v14

    invoke-direct {v9, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 1302
    .local v9, "eventTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_f
    array-length v1, v14

    if-ge v10, v1, :cond_34

    .line 1303
    const-string v1, "add"

    aget-object v15, v14, v10

    invoke-virtual {v15}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v15

    invoke-static {v1, v15, v9}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectListenerMethods(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/util/HashMap;)V

    .line 1305
    const-string v1, "remove"

    aget-object v15, v14, v10

    invoke-virtual {v15}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v15

    invoke-static {v1, v15, v9}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectListenerMethods(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/util/HashMap;)V

    .line 1307
    aget-object v1, v14, v10

    invoke-virtual {v1}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-static {v1, v9}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectGetListenerMethods(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V

    .line 1302
    add-int/lit8 v10, v10, 0x1

    goto :goto_f

    .line 1310
    :cond_34
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1311
    .local v8, "eventList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/EventSetDescriptor;>;"
    invoke-virtual {v9}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :cond_41
    :goto_41
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 1312
    .local v7, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap;>;"
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/HashMap;

    .line 1313
    .local v12, "table":Ljava/util/HashMap;
    const-string v1, "add"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Method;

    .line 1314
    .local v4, "add":Ljava/lang/reflect/Method;
    const-string v1, "remove"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Method;

    .line 1316
    .local v5, "remove":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_41

    if-eqz v5, :cond_41

    .line 1320
    const-string v1, "get"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Method;

    .line 1321
    .local v6, "get":Ljava/lang/reflect/Method;
    const-string v1, "listenerType"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 1322
    .local v2, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "listenerMethods"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/reflect/Method;

    move-object v3, v1

    check-cast v3, [Ljava/lang/reflect/Method;

    .line 1323
    .local v3, "listenerMethods":[Ljava/lang/reflect/Method;
    new-instance v0, Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lorg/msgpack/template/builder/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 1327
    .local v0, "eventSetDescriptor":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    const-string v1, "isUnicast"

    invoke-virtual {v12, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_a1

    const/4 v1, 0x1

    :goto_9a
    invoke-virtual {v0, v1}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->setUnicast(Z)V

    .line 1328
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_41

    .line 1327
    :cond_a1
    const/4 v1, 0x0

    goto :goto_9a

    .line 1331
    .end local v0    # "eventSetDescriptor":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .end local v2    # "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "listenerMethods":[Ljava/lang/reflect/Method;
    .end local v4    # "add":Ljava/lang/reflect/Method;
    .end local v5    # "remove":Ljava/lang/reflect/Method;
    .end local v6    # "get":Ljava/lang/reflect/Method;
    .end local v7    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap;>;"
    .end local v12    # "table":Ljava/util/HashMap;
    :cond_a3
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v13, v1, [Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 1333
    .local v13, "theEvents":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto/16 :goto_7
.end method

.method private static introspectGet(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V
    .registers 11
    .param p0, "theMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "propertyTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const/4 v8, 0x1

    .line 808
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    .line 809
    .local v1, "methodName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 816
    .local v3, "prefixLength":I
    if-nez v1, :cond_9

    .line 874
    :cond_8
    :goto_8
    return-void

    .line 820
    :cond_9
    const-string v7, "get"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_17

    .line 821
    const-string v7, "get"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v3

    .line 824
    :cond_17
    const-string v7, "is"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_25

    .line 825
    const-string v7, "is"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v3

    .line 828
    :cond_25
    if-eqz v3, :cond_8

    .line 832
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/msgpack/template/builder/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 835
    .local v4, "propertyName":Ljava/lang/String;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->isValidProperty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 840
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    .line 842
    .local v5, "propertyType":Ljava/lang/Class;
    if-eqz v5, :cond_8

    sget-object v7, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v5, v7, :cond_8

    .line 847
    const/4 v7, 0x2

    if-ne v3, v7, :cond_46

    .line 848
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v5, v7, :cond_8

    .line 854
    :cond_46
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 855
    .local v2, "paramTypes":[Ljava/lang/Class;
    array-length v7, v2

    if-gt v7, v8, :cond_8

    array-length v7, v2

    if-ne v7, v8, :cond_57

    const/4 v7, 0x0

    aget-object v7, v2, v7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v7, v8, :cond_8

    .line 860
    :cond_57
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/HashMap;

    .line 861
    .local v6, "table":Ljava/util/HashMap;
    if-nez v6, :cond_67

    .line 862
    new-instance v6, Ljava/util/HashMap;

    .end local v6    # "table":Ljava/util/HashMap;
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 863
    .restart local v6    # "table":Ljava/util/HashMap;
    invoke-virtual {p1, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 866
    :cond_67
    const-string v7, "getters"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 867
    .local v0, "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    if-nez v0, :cond_7b

    .line 868
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 869
    .restart local v0    # "getters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    const-string v7, "getters"

    invoke-virtual {v6, v7, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 873
    :cond_7b
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8
.end method

.method private static introspectGetListenerMethods(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V
    .registers 11
    .param p0, "theMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1427
    .local p1, "methodsTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const-string v6, "get"

    .line 1429
    .local v6, "type":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1430
    .local v2, "methodName":Ljava/lang/String;
    if-nez v2, :cond_9

    .line 1466
    :cond_8
    :goto_8
    return-void

    .line 1434
    :cond_9
    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    const-string v7, "Listeners"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1439
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v2, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1441
    .local v1, "listenerName":Ljava/lang/String;
    const/4 v7, 0x0

    const-string v8, "Listener"

    invoke-virtual {v1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1443
    .local v0, "eventName":Ljava/lang/String;
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_8

    .line 1447
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    .line 1448
    .local v3, "paramTypes":[Ljava/lang/Class;
    if-eqz v3, :cond_8

    array-length v7, v3

    if-nez v7, :cond_8

    .line 1452
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    .line 1453
    .local v4, "returnType":Ljava/lang/Class;
    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 1459
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/HashMap;

    .line 1460
    .local v5, "table":Ljava/util/HashMap;
    if-nez v5, :cond_66

    .line 1461
    new-instance v5, Ljava/util/HashMap;

    .end local v5    # "table":Ljava/util/HashMap;
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 1464
    .restart local v5    # "table":Ljava/util/HashMap;
    :cond_66
    invoke-virtual {v5, v6, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1465
    invoke-virtual {p1, v0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8
.end method

.method private static introspectListenerMethods(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/util/HashMap;)V
    .registers 14
    .param p0, "type"    # Ljava/lang/String;
    .param p1, "theMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "methodsTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const/4 v10, 0x0

    .line 1344
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 1345
    .local v5, "methodName":Ljava/lang/String;
    if-nez v5, :cond_8

    .line 1404
    :cond_7
    :goto_7
    return-void

    .line 1349
    :cond_8
    invoke-virtual {v5, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    const-string v8, "Listener"

    invoke-virtual {v5, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1354
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 1355
    .local v3, "listenerName":Ljava/lang/String;
    const-string v8, "Listener"

    invoke-virtual {v3, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v3, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1357
    .local v0, "eventName":Ljava/lang/String;
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_7

    .line 1361
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 1362
    .local v6, "paramTypes":[Ljava/lang/Class;
    if-eqz v6, :cond_7

    array-length v8, v6

    const/4 v9, 0x1

    if-ne v8, v9, :cond_7

    .line 1366
    aget-object v4, v6, v10

    .line 1368
    .local v4, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v8, Ljava/util/EventListener;

    invoke-virtual {v8, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1372
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1376
    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 1377
    .local v7, "table":Ljava/util/HashMap;
    if-nez v7, :cond_5b

    .line 1378
    new-instance v7, Ljava/util/HashMap;

    .end local v7    # "table":Ljava/util/HashMap;
    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 1381
    .restart local v7    # "table":Ljava/util/HashMap;
    :cond_5b
    const-string v8, "listenerType"

    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_71

    .line 1382
    const-string v8, "listenerType"

    invoke-virtual {v7, v8, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1383
    const-string v8, "listenerMethods"

    invoke-static {v4}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectListenerMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1387
    :cond_71
    invoke-virtual {v7, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1390
    const-string v8, "add"

    invoke-virtual {p0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9f

    .line 1391
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 1392
    .local v1, "exceptionTypes":[Ljava/lang/Class;
    if-eqz v1, :cond_9f

    .line 1393
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_83
    array-length v8, v1

    if-ge v2, v8, :cond_9f

    .line 1394
    aget-object v8, v1, v2

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    const-class v9, Ljava/util/TooManyListenersException;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a4

    .line 1396
    const-string v8, "isUnicast"

    const-string v9, "true"

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1403
    .end local v1    # "exceptionTypes":[Ljava/lang/Class;
    .end local v2    # "i":I
    :cond_9f
    invoke-virtual {p2, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_7

    .line 1393
    .restart local v1    # "exceptionTypes":[Ljava/lang/Class;
    .restart local v2    # "i":I
    :cond_a4
    add-int/lit8 v2, v2, 0x1

    goto :goto_83
.end method

.method private static introspectListenerMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 1407
    .local p0, "listenerType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1408
    .local v3, "methods":[Ljava/lang/reflect/Method;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1409
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v5, v3

    if-ge v0, v5, :cond_2b

    .line 1410
    aget-object v5, v3, v0

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 1411
    .local v4, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v5, v4

    const/4 v6, 0x1

    if-eq v5, v6, :cond_1a

    .line 1409
    :cond_17
    :goto_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1415
    :cond_1a
    const-class v5, Ljava/util/EventObject;

    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_17

    .line 1416
    aget-object v5, v3, v0

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 1419
    .end local v4    # "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_2b
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/reflect/Method;

    .line 1420
    .local v2, "matchedMethods":[Ljava/lang/reflect/Method;
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 1421
    return-object v2
.end method

.method private introspectMethods()[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 3

    .prologue
    .line 611
    const/4 v0, 0x0

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    invoke-direct {p0, v0, v1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods(ZLjava/lang/Class;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v0

    return-object v0
.end method

.method private introspectMethods(Z)[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 3
    .param p1, "includeSuper"    # Z

    .prologue
    .line 615
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods(ZLjava/lang/Class;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v0

    return-object v0
.end method

.method private introspectMethods(ZLjava/lang/Class;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 11
    .param p1, "includeSuper"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lorg/msgpack/template/builder/beans/MethodDescriptor;"
        }
    .end annotation

    .prologue
    .line 622
    .local p2, "introspectorClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_d

    invoke-virtual {p2}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 625
    .local v0, "basicMethods":[Ljava/lang/reflect/Method;
    :goto_6
    if-eqz v0, :cond_b

    array-length v7, v0

    if-nez v7, :cond_12

    .line 626
    :cond_b
    const/4 v6, 0x0

    .line 650
    :cond_c
    :goto_c
    return-object v6

    .line 622
    .end local v0    # "basicMethods":[Ljava/lang/reflect/Method;
    :cond_d
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    goto :goto_6

    .line 628
    .restart local v0    # "basicMethods":[Ljava/lang/reflect/Method;
    :cond_12
    new-instance v3, Ljava/util/ArrayList;

    array-length v7, v0

    invoke-direct {v3, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 632
    .local v3, "methodList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v7, v0

    if-ge v1, v7, :cond_35

    .line 633
    aget-object v7, v0, v1

    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    .line 634
    .local v4, "modifiers":I
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v7

    if-eqz v7, :cond_32

    .line 636
    new-instance v5, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    aget-object v7, v0, v1

    invoke-direct {v5, v7}, Lorg/msgpack/template/builder/beans/MethodDescriptor;-><init>(Ljava/lang/reflect/Method;)V

    .line 638
    .local v5, "theDescriptor":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 632
    .end local v5    # "theDescriptor":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_32
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 643
    .end local v4    # "modifiers":I
    :cond_35
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 644
    .local v2, "methodCount":I
    const/4 v6, 0x0

    .line 645
    .local v6, "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-lez v2, :cond_c

    .line 646
    new-array v6, v2, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 647
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    check-cast v6, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .restart local v6    # "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    goto :goto_c
.end method

.method private introspectProperties(Ljava/lang/Class;)[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .registers 39
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Lorg/msgpack/template/builder/beans/PropertyDescriptor;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 667
    .local p1, "stopClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v27

    .line 669
    .local v27, "methodDescriptors":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-nez v27, :cond_9

    .line 670
    const/16 v36, 0x0

    .line 776
    :goto_8
    return-object v36

    .line 673
    :cond_9
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 675
    .local v28, "methodList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    const/16 v22, 0x0

    .local v22, "index":I
    :goto_10
    move-object/from16 v0, v27

    array-length v9, v0

    move/from16 v0, v22

    if-ge v0, v9, :cond_31

    .line 676
    aget-object v9, v27, v22

    invoke-virtual {v9}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v29

    .line 677
    .local v29, "modifiers":I
    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v9

    if-nez v9, :cond_2e

    .line 678
    aget-object v9, v27, v22

    move-object/from16 v0, v28

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 675
    :cond_2e
    add-int/lit8 v22, v22, 0x1

    goto :goto_10

    .line 683
    .end local v29    # "modifiers":I
    :cond_31
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v26

    .line 684
    .local v26, "methodCount":I
    const/16 v35, 0x0

    .line 685
    .local v35, "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-lez v26, :cond_49

    .line 686
    move/from16 v0, v26

    new-array v0, v0, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-object/from16 v35, v0

    .line 687
    move-object/from16 v0, v28

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v35

    .end local v35    # "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    check-cast v35, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 690
    .restart local v35    # "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_49
    if-nez v35, :cond_4e

    .line 691
    const/16 v36, 0x0

    goto :goto_8

    .line 694
    :cond_4e
    new-instance v32, Ljava/util/HashMap;

    move-object/from16 v0, v35

    array-length v9, v0

    move-object/from16 v0, v32

    invoke-direct {v0, v9}, Ljava/util/HashMap;-><init>(I)V

    .line 698
    .local v32, "propertyTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_5a
    move-object/from16 v0, v35

    array-length v9, v0

    move/from16 v0, v20

    if-ge v0, v9, :cond_7a

    .line 699
    aget-object v9, v35, v20

    invoke-virtual {v9}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    move-object/from16 v0, v32

    invoke-static {v9, v0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectGet(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V

    .line 700
    aget-object v9, v35, v20

    invoke-virtual {v9}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    move-object/from16 v0, v32

    invoke-static {v9, v0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectSet(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V

    .line 698
    add-int/lit8 v20, v20, 0x1

    goto :goto_5a

    .line 704
    :cond_7a
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->fixGetSet(Ljava/util/HashMap;)V

    .line 707
    const/4 v9, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods(Z)[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v15

    .line 708
    .local v15, "allMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-eqz p1, :cond_cc

    .line 709
    const/4 v9, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v9, v1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods(ZLjava/lang/Class;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v19

    .line 711
    .local v19, "excludeMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-eqz v19, :cond_cc

    .line 712
    new-instance v34, Ljava/util/ArrayList;

    invoke-direct/range {v34 .. v34}, Ljava/util/ArrayList;-><init>()V

    .line 713
    .local v34, "tempMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    move-object/from16 v16, v15

    .local v16, "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v24, v0

    .local v24, "len$":I
    const/16 v21, 0x0

    .local v21, "i$":I
    :goto_a3
    move/from16 v0, v21

    move/from16 v1, v24

    if-ge v0, v1, :cond_c1

    aget-object v25, v16, v21

    .line 714
    .local v25, "method":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->isInSuper(Lorg/msgpack/template/builder/beans/MethodDescriptor;[Lorg/msgpack/template/builder/beans/MethodDescriptor;)Z

    move-result v9

    if-nez v9, :cond_be

    .line 715
    move-object/from16 v0, v34

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 713
    :cond_be
    add-int/lit8 v21, v21, 0x1

    goto :goto_a3

    .line 718
    .end local v25    # "method":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_c1
    const/4 v9, 0x0

    new-array v9, v9, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-object/from16 v0, v34

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v15

    .end local v15    # "allMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    check-cast v15, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 722
    .end local v16    # "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v19    # "excludeMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v21    # "i$":I
    .end local v24    # "len$":I
    .end local v34    # "tempMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    .restart local v15    # "allMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_cc
    const/16 v20, 0x0

    :goto_ce
    array-length v9, v15

    move/from16 v0, v20

    if-ge v0, v9, :cond_e1

    .line 723
    aget-object v9, v15, v20

    invoke-virtual {v9}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectPropertyListener(Ljava/lang/reflect/Method;)V

    .line 722
    add-int/lit8 v20, v20, 0x1

    goto :goto_ce

    .line 726
    :cond_e1
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 728
    .local v31, "propertyList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    invoke-virtual/range {v32 .. v32}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .local v21, "i$":Ljava/util/Iterator;
    :cond_ee
    :goto_ee
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_18f

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/util/Map$Entry;

    .line 729
    .local v18, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap;>;"
    invoke-interface/range {v18 .. v18}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 730
    .local v4, "propertyName":Ljava/lang/String;
    invoke-interface/range {v18 .. v18}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/util/HashMap;

    .line 731
    .local v33, "table":Ljava/util/HashMap;
    if-eqz v33, :cond_ee

    .line 734
    const-string v9, "normal"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/lang/String;

    .line 735
    .local v30, "normalTag":Ljava/lang/String;
    const-string v9, "indexed"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/String;

    .line 737
    .local v23, "indexedTag":Ljava/lang/String;
    if-nez v30, :cond_120

    if-eqz v23, :cond_ee

    .line 741
    :cond_120
    const-string v9, "normalget"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Method;

    .line 742
    .local v5, "get":Ljava/lang/reflect/Method;
    const-string v9, "normalset"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Method;

    .line 743
    .local v6, "set":Ljava/lang/reflect/Method;
    const-string v9, "indexedget"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/reflect/Method;

    .line 744
    .local v7, "indexedGet":Ljava/lang/reflect/Method;
    const-string v9, "indexedset"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/reflect/Method;

    .line 746
    .local v8, "indexedSet":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 747
    .local v3, "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    if-nez v23, :cond_177

    .line 748
    new-instance v3, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .end local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    invoke-direct {v3, v4, v5, v6}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 762
    .restart local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :goto_150
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->canAddPropertyChangeListener:Z

    if-eqz v9, :cond_18a

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->canRemovePropertyChangeListener:Z

    if-eqz v9, :cond_18a

    .line 763
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setBound(Z)V

    .line 767
    :goto_160
    const-string v9, "isConstrained"

    move-object/from16 v0, v33

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v9, v10, :cond_170

    .line 768
    const/4 v9, 0x1

    invoke-virtual {v3, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setConstrained(Z)V

    .line 770
    :cond_170
    move-object/from16 v0, v31

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_ee

    .line 751
    :cond_177
    :try_start_177
    new-instance v3, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    .end local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    invoke-direct/range {v3 .. v8}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    :try_end_17c
    .catch Lorg/msgpack/template/builder/beans/IntrospectionException; {:try_start_177 .. :try_end_17c} :catch_17d

    .restart local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    goto :goto_150

    .line 753
    .end local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :catch_17d
    move-exception v17

    .line 756
    .local v17, "e":Lorg/msgpack/template/builder/beans/IntrospectionException;
    new-instance v3, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v9, v3

    move-object v10, v4

    move-object v13, v7

    move-object v14, v8

    invoke-direct/range {v9 .. v14}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .restart local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    goto :goto_150

    .line 765
    .end local v17    # "e":Lorg/msgpack/template/builder/beans/IntrospectionException;
    :cond_18a
    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setBound(Z)V

    goto :goto_160

    .line 773
    .end local v3    # "propertyDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .end local v4    # "propertyName":Ljava/lang/String;
    .end local v5    # "get":Ljava/lang/reflect/Method;
    .end local v6    # "set":Ljava/lang/reflect/Method;
    .end local v7    # "indexedGet":Ljava/lang/reflect/Method;
    .end local v8    # "indexedSet":Ljava/lang/reflect/Method;
    .end local v18    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/HashMap;>;"
    .end local v23    # "indexedTag":Ljava/lang/String;
    .end local v30    # "normalTag":Ljava/lang/String;
    .end local v33    # "table":Ljava/util/HashMap;
    :cond_18f
    invoke-virtual/range {v31 .. v31}, Ljava/util/ArrayList;->size()I

    move-result v9

    new-array v0, v9, [Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v36, v0

    .line 775
    .local v36, "theProperties":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    move-object/from16 v0, v31

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto/16 :goto_8
.end method

.method private introspectPropertyListener(Ljava/lang/reflect/Method;)V
    .registers 8
    .param p1, "theMethod"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 791
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .line 792
    .local v0, "methodName":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 793
    .local v1, "param":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v2, v1

    if-eq v2, v4, :cond_e

    .line 802
    :cond_d
    :goto_d
    return-void

    .line 796
    :cond_e
    const-string v2, "addPropertyChangeListener"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    aget-object v2, v1, v5

    const-class v3, Lorg/msgpack/template/builder/beans/PropertyChangeListener;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 798
    iput-boolean v4, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->canAddPropertyChangeListener:Z

    .line 799
    :cond_22
    const-string v2, "removePropertyChangeListener"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    aget-object v2, v1, v5

    const-class v3, Lorg/msgpack/template/builder/beans/PropertyChangeListener;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 801
    iput-boolean v4, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->canRemovePropertyChangeListener:Z

    goto :goto_d
.end method

.method private static introspectSet(Ljava/lang/reflect/Method;Ljava/util/HashMap;)V
    .registers 15
    .param p0, "theMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "propertyTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/HashMap;>;"
    const/4 v12, 0x2

    .line 880
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    .line 881
    .local v5, "methodName":Ljava/lang/String;
    if-nez v5, :cond_8

    .line 937
    :cond_7
    :goto_7
    return-void

    .line 889
    :cond_8
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    .line 890
    .local v8, "returnType":Ljava/lang/Class;
    sget-object v11, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v8, v11, :cond_7

    .line 894
    if-eqz v5, :cond_7

    const-string v11, "set"

    invoke-virtual {v5, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 898
    const-string v11, "set"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {v5, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/msgpack/template/builder/beans/Introspector;->decapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 901
    .local v7, "propertyName":Ljava/lang/String;
    invoke-static {v7}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->isValidProperty(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 908
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    .line 910
    .local v6, "paramTypes":[Ljava/lang/Class;
    array-length v11, v6

    if-eqz v11, :cond_7

    array-length v11, v6

    if-gt v11, v12, :cond_7

    array-length v11, v6

    if-ne v11, v12, :cond_42

    const/4 v11, 0x0

    aget-object v11, v6, v11

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v11, v12, :cond_7

    .line 915
    :cond_42
    invoke-virtual {p1, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/HashMap;

    .line 916
    .local v10, "table":Ljava/util/HashMap;
    if-nez v10, :cond_52

    .line 917
    new-instance v10, Ljava/util/HashMap;

    .end local v10    # "table":Ljava/util/HashMap;
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 918
    .restart local v10    # "table":Ljava/util/HashMap;
    invoke-virtual {p1, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 921
    :cond_52
    const-string v11, "setters"

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/ArrayList;

    .line 922
    .local v9, "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    if-nez v9, :cond_66

    .line 923
    new-instance v9, Ljava/util/ArrayList;

    .end local v9    # "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 924
    .restart local v9    # "setters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    const-string v11, "setters"

    invoke-virtual {v10, v11, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 928
    :cond_66
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getExceptionTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 929
    .local v2, "exceptions":[Ljava/lang/Class;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_6d
    if-ge v3, v4, :cond_83

    aget-object v1, v0, v3

    .line 930
    .local v1, "e":Ljava/lang/Class;
    const-class v11, Lorg/msgpack/template/builder/beans/PropertyVetoException;

    invoke-virtual {v1, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_80

    .line 931
    const-string v11, "isConstrained"

    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v10, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    :cond_80
    add-int/lit8 v3, v3, 0x1

    goto :goto_6d

    .line 936
    .end local v1    # "e":Ljava/lang/Class;
    :cond_83
    invoke-virtual {v9, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7
.end method

.method private isInSuper(Lorg/msgpack/template/builder/beans/MethodDescriptor;[Lorg/msgpack/template/builder/beans/MethodDescriptor;)Z
    .registers 9
    .param p1, "method"    # Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .param p2, "excludeMethods"    # [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .prologue
    .line 781
    move-object v0, p2

    .local v0, "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_1a

    aget-object v3, v0, v1

    .line 782
    .local v3, "m":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    invoke-virtual {p1}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v3}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 783
    const/4 v4, 0x1

    .line 786
    .end local v3    # "m":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :goto_16
    return v4

    .line 781
    .restart local v3    # "m":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 786
    .end local v3    # "m":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_1a
    const/4 v4, 0x0

    goto :goto_16
.end method

.method private static isValidProperty(Ljava/lang/String;)Z
    .registers 2
    .param p0, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 1469
    if-eqz p0, :cond_a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static mergeAttributes(Lorg/msgpack/template/builder/beans/PropertyDescriptor;Lorg/msgpack/template/builder/beans/PropertyDescriptor;)V
    .registers 4
    .param p0, "subDesc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .param p1, "superDesc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .prologue
    .line 494
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->hidden:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->hidden:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->hidden:Z

    .line 495
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->expert:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->expert:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->expert:Z

    .line 496
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->preferred:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->preferred:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->preferred:Z

    .line 497
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->bound:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->bound:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->bound:Z

    .line 498
    iget-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->constrained:Z

    iget-boolean v1, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->constrained:Z

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->constrained:Z

    .line 499
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->name:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->name:Ljava/lang/String;

    .line 500
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->shortDescription:Ljava/lang/String;

    if-nez v0, :cond_33

    iget-object v0, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->shortDescription:Ljava/lang/String;

    if-eqz v0, :cond_33

    .line 502
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->shortDescription:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->shortDescription:Ljava/lang/String;

    .line 504
    :cond_33
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->displayName:Ljava/lang/String;

    if-nez v0, :cond_3f

    iget-object v0, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->displayName:Ljava/lang/String;

    if-eqz v0, :cond_3f

    .line 505
    iget-object v0, p1, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->displayName:Ljava/lang/String;

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->displayName:Ljava/lang/String;

    .line 507
    :cond_3f
    return-void
.end method

.method private mergeEvents([Lorg/msgpack/template/builder/beans/EventSetDescriptor;I)[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .registers 15
    .param p1, "otherEvents"    # [Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .param p2, "otherDefaultIndex"    # I

    .prologue
    .line 531
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    invoke-static {v10}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->internalAsMap([Lorg/msgpack/template/builder/beans/EventSetDescriptor;)Ljava/util/HashMap;

    move-result-object v8

    .line 532
    .local v8, "subMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/EventSetDescriptor;>;"
    const/4 v1, 0x0

    .line 533
    .local v1, "defaultEventName":Ljava/lang/String;
    iget v10, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    if-ltz v10, :cond_35

    iget v10, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    iget-object v11, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    array-length v11, v11

    if-ge v10, v11, :cond_35

    .line 534
    iget-object v10, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    iget v11, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    aget-object v10, v10, v11

    invoke-virtual {v10}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    .line 540
    :cond_1c
    :goto_1c
    move-object v0, p1

    .local v0, "arr$":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1f
    if-ge v5, v6, :cond_45

    aget-object v2, v0, v5

    .line 541
    .local v2, "event":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    .line 542
    .local v3, "eventName":Ljava/lang/String;
    invoke-virtual {v8, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 543
    .local v7, "subEvent":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    if-nez v7, :cond_41

    .line 544
    invoke-virtual {v8, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 540
    :goto_32
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 535
    .end local v0    # "arr$":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .end local v2    # "event":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .end local v3    # "eventName":Ljava/lang/String;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "subEvent":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    :cond_35
    if-ltz p2, :cond_1c

    array-length v10, p1

    if-ge p2, v10, :cond_1c

    .line 537
    aget-object v10, p1, p2

    invoke-virtual {v10}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_1c

    .line 546
    .restart local v0    # "arr$":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .restart local v2    # "event":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .restart local v3    # "eventName":Ljava/lang/String;
    .restart local v5    # "i$":I
    .restart local v6    # "len$":I
    .restart local v7    # "subEvent":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    :cond_41
    invoke-virtual {v7, v2}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->merge(Lorg/msgpack/template/builder/beans/EventSetDescriptor;)V

    goto :goto_32

    .line 550
    .end local v2    # "event":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .end local v3    # "eventName":Ljava/lang/String;
    .end local v7    # "subEvent":Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    :cond_45
    invoke-virtual {v8}, Ljava/util/HashMap;->size()I

    move-result v10

    new-array v9, v10, [Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 551
    .local v9, "theEvents":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    invoke-virtual {v8}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v10, v9}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 553
    if-eqz v1, :cond_6a

    iget-boolean v10, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitEvents:Z

    if-nez v10, :cond_6a

    .line 554
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_59
    array-length v10, v9

    if-ge v4, v10, :cond_6a

    .line 555
    aget-object v10, v9, v4

    invoke-virtual {v10}, Lorg/msgpack/template/builder/beans/EventSetDescriptor;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6b

    .line 556
    iput v4, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    .line 561
    .end local v4    # "i":I
    :cond_6a
    return-object v9

    .line 554
    .restart local v4    # "i":I
    :cond_6b
    add-int/lit8 v4, v4, 0x1

    goto :goto_59
.end method

.method private mergeMethods([Lorg/msgpack/template/builder/beans/MethodDescriptor;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 11
    .param p1, "superDescs"    # [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .prologue
    .line 513
    iget-object v8, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    invoke-static {v8}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->internalAsMap([Lorg/msgpack/template/builder/beans/MethodDescriptor;)Ljava/util/HashMap;

    move-result-object v5

    .line 515
    .local v5, "subMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/MethodDescriptor;>;"
    move-object v0, p1

    .local v0, "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_9
    if-ge v1, v2, :cond_27

    aget-object v6, v0, v1

    .line 516
    .local v6, "superMethod":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    invoke-virtual {v6}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-static {v8}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->getQualifiedName(Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v4

    .line 517
    .local v4, "methodName":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 518
    .local v3, "method":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-nez v3, :cond_23

    .line 519
    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 515
    :goto_20
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 521
    :cond_23
    invoke-virtual {v3, v6}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->merge(Lorg/msgpack/template/builder/beans/MethodDescriptor;)V

    goto :goto_20

    .line 524
    .end local v3    # "method":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v4    # "methodName":Ljava/lang/String;
    .end local v6    # "superMethod":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_27
    invoke-virtual {v5}, Ljava/util/HashMap;->size()I

    move-result v8

    new-array v7, v8, [Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 525
    .local v7, "theMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 526
    return-object v7
.end method

.method private mergeProps([Lorg/msgpack/template/builder/beans/PropertyDescriptor;I)[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .registers 37
    .param p1, "superDescs"    # [Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .param p2, "superDefaultIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->internalAsMap([Lorg/msgpack/template/builder/beans/PropertyDescriptor;)Ljava/util/HashMap;

    move-result-object v18

    .line 243
    .local v18, "subMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/msgpack/template/builder/beans/PropertyDescriptor;>;"
    const/4 v4, 0x0

    .line 244
    .local v4, "defaultPropertyName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    move/from16 v29, v0

    if-ltz v29, :cond_5e

    move-object/from16 v0, p0

    iget v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    move/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    array-length v0, v0

    move/from16 v30, v0

    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_5e

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    move/from16 v30, v0

    aget-object v29, v29, v30

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v4

    .line 252
    :cond_3c
    :goto_3c
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_3d
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v29, v0

    move/from16 v0, v29

    if-ge v5, v0, :cond_364

    .line 253
    aget-object v21, p1, v5

    .line 254
    .local v21, "superDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    invoke-virtual/range {v21 .. v21}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v12

    .line 255
    .local v12, "propertyName":Ljava/lang/String;
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_72

    .line 256
    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    :goto_5b
    add-int/lit8 v5, v5, 0x1

    goto :goto_3d

    .line 247
    .end local v5    # "i":I
    .end local v12    # "propertyName":Ljava/lang/String;
    .end local v21    # "superDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_5e
    if-ltz p2, :cond_3c

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v29, v0

    move/from16 v0, p2

    move/from16 v1, v29

    if-ge v0, v1, :cond_3c

    .line 249
    aget-object v29, p1, p2

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v4

    goto :goto_3c

    .line 260
    .restart local v5    # "i":I
    .restart local v12    # "propertyName":Ljava/lang/String;
    .restart local v21    # "superDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_72
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    .local v28, "value":Ljava/lang/Object;
    move-object/from16 v29, v28

    .line 262
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v14

    .local v14, "subGet":Ljava/lang/reflect/Method;
    move-object/from16 v29, v28

    .line 263
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v19

    .line 264
    .local v19, "subSet":Ljava/lang/reflect/Method;
    invoke-virtual/range {v21 .. v21}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v22

    .line 265
    .local v22, "superGet":Ljava/lang/reflect/Method;
    invoke-virtual/range {v21 .. v21}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v25

    .line 267
    .local v25, "superSet":Ljava/lang/reflect/Method;
    invoke-virtual/range {v21 .. v21}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v26

    .line 268
    .local v26, "superType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v24, 0x0

    .local v24, "superIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v29, v28

    .line 269
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v20

    .line 270
    .local v20, "subType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v17, 0x0

    .line 272
    .local v17, "subIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v28

    instance-of v0, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    move/from16 v29, v0

    if-eqz v29, :cond_b0

    move-object/from16 v29, v28

    .line 273
    check-cast v29, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedPropertyType()Ljava/lang/Class;

    move-result-object v17

    .line 276
    :cond_b0
    move-object/from16 v0, v21

    instance-of v0, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    move/from16 v29, v0

    if-eqz v29, :cond_c0

    move-object/from16 v29, v21

    .line 277
    check-cast v29, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedPropertyType()Ljava/lang/Class;

    move-result-object v24

    .line 282
    :cond_c0
    if-nez v24, :cond_1f5

    move-object/from16 v13, v28

    .line 283
    check-cast v13, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 285
    .local v13, "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    if-nez v17, :cond_180

    .line 287
    if-eqz v20, :cond_131

    if-eqz v26, :cond_131

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    if-eqz v29, :cond_131

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_131

    .line 290
    if-eqz v22, :cond_f1

    if-eqz v14, :cond_ec

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_f1

    .line 292
    :cond_ec
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 294
    :cond_f1
    if-eqz v25, :cond_104

    if-eqz v19, :cond_ff

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_104

    .line 296
    :cond_ff
    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    .line 298
    :cond_104
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    if-ne v0, v1, :cond_121

    if-eqz v14, :cond_121

    if-eqz v22, :cond_121

    .line 300
    invoke-virtual/range {v22 .. v22}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v29

    const-string v30, "is"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_121

    .line 301
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 360
    :cond_121
    :goto_121
    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .end local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_126
    :goto_126
    check-cast v28, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .end local v28    # "value":Ljava/lang/Object;
    move-object/from16 v0, v28

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeAttributes(Lorg/msgpack/template/builder/beans/PropertyDescriptor;Lorg/msgpack/template/builder/beans/PropertyDescriptor;)V

    goto/16 :goto_5b

    .line 305
    .restart local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .restart local v28    # "value":Ljava/lang/Object;
    :cond_131
    if-eqz v14, :cond_135

    if-nez v19, :cond_121

    :cond_135
    if-eqz v22, :cond_121

    .line 307
    new-instance v13, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .end local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v25

    invoke-direct {v13, v12, v0, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 309
    .restart local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    if-eqz v14, :cond_121

    .line 310
    invoke-virtual {v14}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v15

    .line 311
    .local v15, "subGetName":Ljava/lang/String;
    const/4 v9, 0x0

    .line 312
    .local v9, "method":Ljava/lang/reflect/Method;
    invoke-direct/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->introspectMethods()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v7

    .line 313
    .local v7, "introspectMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    move-object v2, v7

    .local v2, "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_14e
    if-ge v6, v8, :cond_121

    aget-object v10, v2, v6

    .line 314
    .local v10, "methodDesc":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    invoke-virtual {v10}, Lorg/msgpack/template/builder/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    .line 315
    if-eq v9, v14, :cond_17d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_17d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v29

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    if-nez v29, :cond_17d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    if-ne v0, v1, :cond_17d

    .line 320
    invoke-virtual {v13, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    goto :goto_121

    .line 313
    :cond_17d
    add-int/lit8 v6, v6, 0x1

    goto :goto_14e

    .line 328
    .end local v2    # "arr$":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v6    # "i$":I
    .end local v7    # "introspectMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v8    # "len$":I
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v10    # "methodDesc":Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .end local v15    # "subGetName":Ljava/lang/String;
    :cond_180
    if-eqz v26, :cond_1ac

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->isArray()Z

    move-result v29

    if-eqz v29, :cond_1ac

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_1ac

    .line 332
    if-nez v14, :cond_1a3

    if-eqz v22, :cond_1a3

    .line 333
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 335
    :cond_1a3
    if-nez v19, :cond_1ac

    if-eqz v25, :cond_1ac

    .line 336
    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    .line 340
    :cond_1ac
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, v29

    if-ne v0, v1, :cond_121

    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v26

    move-object/from16 v1, v29

    if-ne v0, v1, :cond_121

    move-object/from16 v29, v13

    .line 342
    check-cast v29, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v16

    .line 344
    .local v16, "subIndexedSet":Ljava/lang/reflect/Method;
    if-nez v14, :cond_121

    if-nez v19, :cond_121

    if-eqz v16, :cond_121

    if-eqz v22, :cond_121

    .line 347
    :try_start_1cc
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    move-object/from16 v29, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v30

    const/16 v31, 0x1

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    sget-object v33, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v33, v31, v32

    invoke-virtual/range {v29 .. v31}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_1e7
    .catch Ljava/lang/Exception; {:try_start_1cc .. :try_end_1e7} :catch_3ac

    move-result-object v19

    .line 352
    :goto_1e8
    if-eqz v19, :cond_121

    .line 354
    new-instance v13, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .end local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-direct {v13, v12, v0, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .restart local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    goto/16 :goto_121

    .line 362
    .end local v13    # "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .end local v16    # "subIndexedSet":Ljava/lang/reflect/Method;
    :cond_1f5
    if-nez v17, :cond_30b

    .line 363
    if-eqz v20, :cond_22a

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->isArray()Z

    move-result v29

    if-eqz v29, :cond_22a

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_22a

    .line 368
    if-eqz v14, :cond_218

    .line 369
    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 371
    :cond_218
    if-eqz v19, :cond_221

    .line 372
    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    .line 374
    :cond_221
    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_126

    .line 380
    :cond_22a
    if-eqz v14, :cond_22e

    if-nez v19, :cond_28d

    .line 381
    :cond_22e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    .line 382
    .local v3, "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 383
    .local v11, "methodSuffix":Ljava/lang/String;
    const/4 v9, 0x0

    .line 384
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    if-nez v14, :cond_2c0

    .line 386
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    if-ne v0, v1, :cond_29a

    .line 388
    :try_start_249
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "is"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_26d
    .catch Ljava/lang/Exception; {:try_start_249 .. :try_end_26d} :catch_3a9

    move-result-object v9

    .line 403
    :goto_26e
    if-eqz v9, :cond_28d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v29

    if-nez v29, :cond_28d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_28d

    move-object/from16 v29, v28

    .line 407
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v0, v29

    invoke-virtual {v0, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .end local v3    # "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "methodSuffix":Ljava/lang/String;
    :cond_28d
    :goto_28d
    move-object/from16 v29, v28

    .line 427
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v0, v18

    move-object/from16 v1, v29

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_126

    .line 396
    .restart local v3    # "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    .restart local v11    # "methodSuffix":Ljava/lang/String;
    :cond_29a
    :try_start_29a
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "get"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_2be
    .catch Ljava/lang/Exception; {:try_start_29a .. :try_end_2be} :catch_3a6

    move-result-object v9

    goto :goto_26e

    .line 413
    :cond_2c0
    :try_start_2c0
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "set"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput-object v20, v30, v31

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v3, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_2e8
    .catch Ljava/lang/Exception; {:try_start_2c0 .. :try_end_2e8} :catch_3a3

    move-result-object v9

    .line 418
    :goto_2e9
    if-eqz v9, :cond_28d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v29

    if-nez v29, :cond_28d

    invoke-virtual {v9}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v29

    sget-object v30, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_28d

    move-object/from16 v29, v28

    .line 422
    check-cast v29, Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v0, v29

    invoke-virtual {v0, v9}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    goto :goto_28d

    .line 429
    .end local v3    # "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "methodSuffix":Ljava/lang/String;
    :cond_30b
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_126

    move-object/from16 v13, v28

    .line 432
    check-cast v13, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    .line 433
    .local v13, "subDesc":Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
    if-nez v14, :cond_326

    if-eqz v22, :cond_326

    .line 434
    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V

    .line 436
    :cond_326
    if-nez v19, :cond_32f

    if-eqz v25, :cond_32f

    .line 437
    move-object/from16 v0, v25

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setWriteMethod(Ljava/lang/reflect/Method;)V

    :cond_32f
    move-object/from16 v23, v21

    .line 439
    check-cast v23, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    .line 441
    .local v23, "superIndexedDesc":Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
    invoke-virtual {v13}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    if-nez v29, :cond_348

    invoke-virtual/range {v23 .. v23}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    if-eqz v29, :cond_348

    .line 443
    invoke-virtual/range {v23 .. v23}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedReadMethod(Ljava/lang/reflect/Method;)V

    .line 447
    :cond_348
    invoke-virtual {v13}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    if-nez v29, :cond_35d

    invoke-virtual/range {v23 .. v23}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    if-eqz v29, :cond_35d

    .line 449
    invoke-virtual/range {v23 .. v23}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getIndexedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v13, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedWriteMethod(Ljava/lang/reflect/Method;)V

    .line 453
    :cond_35d
    move-object/from16 v0, v18

    invoke-virtual {v0, v12, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_126

    .line 459
    .end local v12    # "propertyName":Ljava/lang/String;
    .end local v13    # "subDesc":Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
    .end local v14    # "subGet":Ljava/lang/reflect/Method;
    .end local v17    # "subIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v19    # "subSet":Ljava/lang/reflect/Method;
    .end local v20    # "subType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "superDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .end local v22    # "superGet":Ljava/lang/reflect/Method;
    .end local v23    # "superIndexedDesc":Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
    .end local v24    # "superIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v25    # "superSet":Ljava/lang/reflect/Method;
    .end local v26    # "superType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v28    # "value":Ljava/lang/Object;
    :cond_364
    invoke-virtual/range {v18 .. v18}, Ljava/util/HashMap;->size()I

    move-result v29

    move/from16 v0, v29

    new-array v0, v0, [Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-object/from16 v27, v0

    .line 460
    .local v27, "theDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    invoke-virtual/range {v18 .. v18}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v29

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 462
    if-eqz v4, :cond_39f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitProperties:Z

    move/from16 v29, v0

    if-nez v29, :cond_39f

    .line 463
    const/4 v5, 0x0

    :goto_384
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v29, v0

    move/from16 v0, v29

    if-ge v5, v0, :cond_39f

    .line 464
    aget-object v29, v27, v5

    invoke-virtual/range {v29 .. v29}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_3a0

    .line 465
    move-object/from16 v0, p0

    iput v5, v0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    .line 470
    :cond_39f
    return-object v27

    .line 463
    :cond_3a0
    add-int/lit8 v5, v5, 0x1

    goto :goto_384

    .line 415
    .end local v27    # "theDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .restart local v3    # "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "method":Ljava/lang/reflect/Method;
    .restart local v11    # "methodSuffix":Ljava/lang/String;
    .restart local v12    # "propertyName":Ljava/lang/String;
    .restart local v14    # "subGet":Ljava/lang/reflect/Method;
    .restart local v17    # "subIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v19    # "subSet":Ljava/lang/reflect/Method;
    .restart local v20    # "subType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v21    # "superDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .restart local v22    # "superGet":Ljava/lang/reflect/Method;
    .restart local v24    # "superIndexedType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v25    # "superSet":Ljava/lang/reflect/Method;
    .restart local v26    # "superType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v28    # "value":Ljava/lang/Object;
    :catch_3a3
    move-exception v29

    goto/16 :goto_2e9

    .line 399
    :catch_3a6
    move-exception v29

    goto/16 :goto_26e

    .line 391
    :catch_3a9
    move-exception v29

    goto/16 :goto_26e

    .line 349
    .end local v3    # "beanSuperClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "method":Ljava/lang/reflect/Method;
    .end local v11    # "methodSuffix":Ljava/lang/String;
    .local v13, "subDesc":Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .restart local v16    # "subIndexedSet":Ljava/lang/reflect/Method;
    :catch_3ac
    move-exception v29

    goto/16 :goto_1e8
.end method


# virtual methods
.method public getAdditionalBeanInfo()[Lorg/msgpack/template/builder/beans/BeanInfo;
    .registers 2

    .prologue
    .line 154
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeanDescriptor()Lorg/msgpack/template/builder/beans/BeanDescriptor;
    .registers 3

    .prologue
    .line 174
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    if-nez v0, :cond_1d

    .line 175
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitBeanInfo:Lorg/msgpack/template/builder/beans/BeanInfo;

    if-eqz v0, :cond_10

    .line 176
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitBeanInfo:Lorg/msgpack/template/builder/beans/BeanInfo;

    invoke-interface {v0}, Lorg/msgpack/template/builder/beans/BeanInfo;->getBeanDescriptor()Lorg/msgpack/template/builder/beans/BeanDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    .line 178
    :cond_10
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    if-nez v0, :cond_1d

    .line 179
    new-instance v0, Lorg/msgpack/template/builder/beans/BeanDescriptor;

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanClass:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/BeanDescriptor;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    .line 182
    :cond_1d
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->beanDescriptor:Lorg/msgpack/template/builder/beans/BeanDescriptor;

    return-object v0
.end method

.method public getDefaultEventIndex()I
    .registers 2

    .prologue
    .line 187
    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    return v0
.end method

.method public getDefaultPropertyIndex()I
    .registers 2

    .prologue
    .line 192
    iget v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    return v0
.end method

.method public getEventSetDescriptors()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    return-object v0
.end method

.method public getMethodDescriptors()[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    return-object v0
.end method

.method public getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    return-object v0
.end method

.method init()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 1483
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    if-nez v2, :cond_9

    .line 1484
    new-array v2, v3, [Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    iput-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 1486
    :cond_9
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    if-nez v2, :cond_11

    .line 1487
    new-array v2, v3, [Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    iput-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 1490
    :cond_11
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    if-eqz v2, :cond_43

    .line 1491
    iget v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_44

    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    iget v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1494
    .local v0, "defaultPropertyName":Ljava/lang/String;
    :goto_24
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    sget-object v3, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->comparator:Lorg/msgpack/template/builder/beans/StandardBeanInfo$PropertyComparator;

    invoke-static {v2, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 1495
    if-eqz v0, :cond_43

    .line 1496
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2e
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    array-length v2, v2

    if-ge v1, v2, :cond_43

    .line 1497
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_46

    .line 1498
    iput v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    .line 1504
    .end local v0    # "defaultPropertyName":Ljava/lang/String;
    .end local v1    # "i":I
    :cond_43
    return-void

    .line 1491
    :cond_44
    const/4 v0, 0x0

    goto :goto_24

    .line 1496
    .restart local v0    # "defaultPropertyName":Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e
.end method

.method mergeBeanInfo(Lorg/msgpack/template/builder/beans/BeanInfo;Z)V
    .registers 7
    .param p1, "beanInfo"    # Lorg/msgpack/template/builder/beans/BeanInfo;
    .param p2, "force"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 197
    if-nez p2, :cond_6

    iget-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitProperties:Z

    if-nez v3, :cond_1c

    .line 198
    :cond_6
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    .line 199
    .local v0, "superDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    if-eqz v0, :cond_1c

    .line 200
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->getPropertyDescriptors()[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v3

    if-eqz v3, :cond_4d

    .line 201
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultPropertyIndex()I

    move-result v3

    invoke-direct {p0, v0, v3}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeProps([Lorg/msgpack/template/builder/beans/PropertyDescriptor;I)[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v3

    iput-object v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 210
    .end local v0    # "superDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_1c
    :goto_1c
    if-nez p2, :cond_22

    iget-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitMethods:Z

    if-nez v3, :cond_32

    .line 211
    :cond_22
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getMethodDescriptors()[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v2

    .line 212
    .local v2, "superMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    if-eqz v2, :cond_32

    .line 213
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    if-eqz v3, :cond_56

    .line 214
    invoke-direct {p0, v2}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeMethods([Lorg/msgpack/template/builder/beans/MethodDescriptor;)[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    move-result-object v3

    iput-object v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    .line 221
    .end local v2    # "superMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_32
    :goto_32
    if-nez p2, :cond_38

    iget-boolean v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->explicitEvents:Z

    if-nez v3, :cond_4c

    .line 222
    :cond_38
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getEventSetDescriptors()[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    move-result-object v1

    .line 224
    .local v1, "superEvents":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    if-eqz v1, :cond_4c

    .line 225
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    if-eqz v3, :cond_59

    .line 226
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultEventIndex()I

    move-result v3

    invoke-direct {p0, v1, v3}, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->mergeEvents([Lorg/msgpack/template/builder/beans/EventSetDescriptor;I)[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    move-result-object v3

    iput-object v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 234
    .end local v1    # "superEvents":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    :cond_4c
    :goto_4c
    return-void

    .line 204
    .restart local v0    # "superDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    :cond_4d
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->properties:[Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 205
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultPropertyIndex()I

    move-result v3

    iput v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultPropertyIndex:I

    goto :goto_1c

    .line 216
    .end local v0    # "superDescs":[Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .restart local v2    # "superMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    :cond_56
    iput-object v2, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->methods:[Lorg/msgpack/template/builder/beans/MethodDescriptor;

    goto :goto_32

    .line 229
    .end local v2    # "superMethods":[Lorg/msgpack/template/builder/beans/MethodDescriptor;
    .restart local v1    # "superEvents":[Lorg/msgpack/template/builder/beans/EventSetDescriptor;
    :cond_59
    iput-object v1, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->events:[Lorg/msgpack/template/builder/beans/EventSetDescriptor;

    .line 230
    invoke-interface {p1}, Lorg/msgpack/template/builder/beans/BeanInfo;->getDefaultEventIndex()I

    move-result v3

    iput v3, p0, Lorg/msgpack/template/builder/beans/StandardBeanInfo;->defaultEventIndex:I

    goto :goto_4c
.end method
