.class final Lfreemarker/ext/beans/StaticModel;
.super Ljava/lang/Object;
.source "StaticModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# static fields
.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final clazz:Ljava/lang/Class;

.field private final map:Ljava/util/Map;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 79
    const-string v0, "freemarker.beans"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/StaticModel;->logger:Lfreemarker/log/Logger;

    return-void
.end method

.method constructor <init>(Ljava/lang/Class;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    .line 86
    iput-object p1, p0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    .line 87
    iput-object p2, p0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 88
    invoke-direct {p0}, Lfreemarker/ext/beans/StaticModel;->populate()V

    .line 89
    return-void
.end method

.method private populate()V
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 146
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getModifiers()I

    move-result v13

    invoke-static {v13}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v13

    if-nez v13, :cond_2f

    .line 148
    new-instance v13, Lfreemarker/template/TemplateModelException;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "Can\'t wrap the non-public class "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 152
    :cond_2f
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v13}, Lfreemarker/ext/beans/BeansWrapper;->getExposureLevel()I

    move-result v13

    const/4 v14, 0x3

    if-ne v13, v14, :cond_3b

    .line 236
    :cond_3a
    return-void

    .line 157
    :cond_3b
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 158
    .local v4, "fields":[Ljava/lang/reflect/Field;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_44
    array-length v13, v4

    if-ge v5, v13, :cond_8d

    .line 160
    aget-object v3, v4, v5

    .line 161
    .local v3, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v8

    .line 162
    .local v8, "mod":I
    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v13

    if-eqz v13, :cond_7e

    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v13

    if-eqz v13, :cond_7e

    .line 164
    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v13

    if-eqz v13, :cond_81

    .line 169
    :try_start_5f
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v15}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v15

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    invoke-interface/range {v15 .. v16}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v15

    invoke-interface {v13, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7e
    .catch Ljava/lang/IllegalAccessException; {:try_start_5f .. :try_end_7e} :catch_195

    .line 158
    :cond_7e
    :goto_7e
    add-int/lit8 v5, v5, 0x1

    goto :goto_44

    .line 179
    :cond_81
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v13, v14, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7e

    .line 182
    .end local v3    # "field":Ljava/lang/reflect/Field;
    .end local v8    # "mod":I
    :cond_8d
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v13}, Lfreemarker/ext/beans/BeansWrapper;->getExposureLevel()I

    move-result v13

    const/4 v14, 0x2

    if-ge v13, v14, :cond_3a

    .line 184
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v13}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v7

    .line 185
    .local v7, "methods":[Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    :goto_a1
    array-length v13, v7

    if-ge v5, v13, :cond_14c

    .line 187
    aget-object v6, v7, v5

    .line 188
    .local v6, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v8

    .line 189
    .restart local v8    # "mod":I
    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v13

    if-eqz v13, :cond_e8

    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v13

    if-eqz v13, :cond_e8

    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v13, v6}, Lfreemarker/ext/beans/BeansWrapper;->isSafeMethod(Ljava/lang/reflect/Method;)Z

    move-result v13

    if-eqz v13, :cond_e8

    .line 191
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    .line 192
    .local v9, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v13, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 193
    .local v10, "obj":Ljava/lang/Object;
    instance-of v13, v10, Ljava/lang/reflect/Method;

    if-eqz v13, :cond_eb

    .line 195
    new-instance v11, Lfreemarker/ext/beans/OverloadedMethods;

    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v11, v13}, Lfreemarker/ext/beans/OverloadedMethods;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    .line 196
    .local v11, "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    check-cast v10, Ljava/lang/reflect/Method;

    .end local v10    # "obj":Ljava/lang/Object;
    invoke-virtual {v11, v10}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    .line 197
    invoke-virtual {v11, v6}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v13, v9, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    .end local v9    # "name":Ljava/lang/String;
    .end local v11    # "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    :cond_e8
    :goto_e8
    add-int/lit8 v5, v5, 0x1

    goto :goto_a1

    .line 200
    .restart local v9    # "name":Ljava/lang/String;
    .restart local v10    # "obj":Ljava/lang/Object;
    :cond_eb
    instance-of v13, v10, Lfreemarker/ext/beans/OverloadedMethods;

    if-eqz v13, :cond_f6

    move-object v11, v10

    .line 202
    check-cast v11, Lfreemarker/ext/beans/OverloadedMethods;

    .line 203
    .restart local v11    # "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    invoke-virtual {v11, v6}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    goto :goto_e8

    .line 207
    .end local v11    # "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    :cond_f6
    if-eqz v10, :cond_144

    .line 209
    sget-object v13, Lfreemarker/ext/beans/StaticModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v13}, Lfreemarker/log/Logger;->isInfoEnabled()Z

    move-result v13

    if-eqz v13, :cond_144

    .line 210
    sget-object v13, Lfreemarker/ext/beans/StaticModel;->logger:Lfreemarker/log/Logger;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string v15, "Overwriting value ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "] for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, " key \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "\' with ["

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string v15, "] in static model for "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v15}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lfreemarker/log/Logger;->info(Ljava/lang/String;)V

    .line 215
    :cond_144
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v13, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e8

    .line 219
    .end local v6    # "method":Ljava/lang/reflect/Method;
    .end local v8    # "mod":I
    .end local v9    # "name":Ljava/lang/String;
    .end local v10    # "obj":Ljava/lang/Object;
    :cond_14c
    move-object/from16 v0, p0

    iget-object v13, v0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "entries":Ljava/util/Iterator;
    :cond_158
    :goto_158
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3a

    .line 221
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 222
    .local v2, "entry":Ljava/util/Map$Entry;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    .line 223
    .local v12, "value":Ljava/lang/Object;
    instance-of v13, v12, Ljava/lang/reflect/Method;

    if-eqz v13, :cond_185

    move-object v6, v12

    .line 225
    check-cast v6, Ljava/lang/reflect/Method;

    .line 226
    .restart local v6    # "method":Ljava/lang/reflect/Method;
    new-instance v13, Lfreemarker/ext/beans/SimpleMethodModel;

    const/4 v14, 0x0

    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v13, v14, v6, v15, v0}, Lfreemarker/ext/beans/SimpleMethodModel;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Class;Lfreemarker/ext/beans/BeansWrapper;)V

    invoke-interface {v2, v13}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_158

    .line 229
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :cond_185
    instance-of v13, v12, Lfreemarker/ext/beans/OverloadedMethods;

    if-eqz v13, :cond_158

    .line 231
    new-instance v13, Lfreemarker/ext/beans/OverloadedMethodsModel;

    const/4 v14, 0x0

    check-cast v12, Lfreemarker/ext/beans/OverloadedMethods;

    .end local v12    # "value":Ljava/lang/Object;
    invoke-direct {v13, v14, v12}, Lfreemarker/ext/beans/OverloadedMethodsModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/OverloadedMethods;)V

    invoke-interface {v2, v13}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_158

    .line 171
    .end local v1    # "entries":Ljava/util/Iterator;
    .end local v2    # "entry":Ljava/util/Map$Entry;
    .end local v7    # "methods":[Ljava/lang/reflect/Method;
    .restart local v3    # "field":Ljava/lang/reflect/Field;
    .restart local v8    # "mod":I
    :catch_195
    move-exception v13

    goto/16 :goto_7e
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v2, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 100
    .local v1, "model":Ljava/lang/Object;
    instance-of v2, v1, Lfreemarker/template/TemplateModel;

    if-eqz v2, :cond_d

    .line 101
    check-cast v1, Lfreemarker/template/TemplateModel;

    .line 107
    .end local v1    # "model":Ljava/lang/Object;
    :goto_c
    return-object v1

    .line 103
    .restart local v1    # "model":Ljava/lang/Object;
    :cond_d
    instance-of v2, v1, Ljava/lang/reflect/Field;

    if-eqz v2, :cond_4d

    .line 107
    :try_start_11
    iget-object v2, p0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v2}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    check-cast v1, Ljava/lang/reflect/Field;

    .end local v1    # "model":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_21
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_21} :catch_23

    move-result-object v1

    goto :goto_c

    .line 109
    :catch_23
    move-exception v0

    .line 111
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Illegal access for field "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " of class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 116
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .restart local v1    # "model":Ljava/lang/Object;
    :cond_4d
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No such key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " in class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/beans/StaticModel;->clazz:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lfreemarker/ext/beans/StaticModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/beans/StaticModel;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v0, v1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    return-object v0
.end method
