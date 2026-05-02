.class public Lorg/apache/commons/validator/util/ValidatorUtils;
.super Ljava/lang/Object;
.source "ValidatorUtils.java"


# static fields
.field static class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 106
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

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method public static copyFastHashMap(Lorg/apache/commons/collections/FastHashMap;)Lorg/apache/commons/collections/FastHashMap;
    .registers 7
    .param p0, "map"    # Lorg/apache/commons/collections/FastHashMap;

    .prologue
    .line 145
    new-instance v3, Lorg/apache/commons/collections/FastHashMap;

    invoke-direct {v3}, Lorg/apache/commons/collections/FastHashMap;-><init>()V

    .line 147
    .local v3, "results":Lorg/apache/commons/collections/FastHashMap;
    invoke-virtual {p0}, Lorg/apache/commons/collections/FastHashMap;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 148
    .local v1, "i":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    .line 149
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 150
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 151
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 153
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Lorg/apache/commons/validator/Msg;

    if-eqz v5, :cond_31

    .line 154
    check-cast v4, Lorg/apache/commons/validator/Msg;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Msg;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 155
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_31
    instance-of v5, v4, Lorg/apache/commons/validator/Arg;

    if-eqz v5, :cond_3f

    .line 156
    check-cast v4, Lorg/apache/commons/validator/Arg;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Arg;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 157
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_3f
    instance-of v5, v4, Lorg/apache/commons/validator/Var;

    if-eqz v5, :cond_4d

    .line 158
    check-cast v4, Lorg/apache/commons/validator/Var;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Var;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v2, v5}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 160
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_4d
    invoke-virtual {v3, v2, v4}, Lorg/apache/commons/collections/FastHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 164
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_51
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Lorg/apache/commons/collections/FastHashMap;->setFast(Z)V

    .line 165
    return-object v3
.end method

.method public static copyMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 7
    .param p0, "map"    # Ljava/util/Map;

    .prologue
    .line 178
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 180
    .local v3, "results":Ljava/util/Map;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 181
    .local v1, "i":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    .line 182
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 183
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 184
    .local v2, "key":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 186
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Lorg/apache/commons/validator/Msg;

    if-eqz v5, :cond_31

    .line 187
    check-cast v4, Lorg/apache/commons/validator/Msg;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Msg;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 188
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_31
    instance-of v5, v4, Lorg/apache/commons/validator/Arg;

    if-eqz v5, :cond_3f

    .line 189
    check-cast v4, Lorg/apache/commons/validator/Arg;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Arg;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 190
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_3f
    instance-of v5, v4, Lorg/apache/commons/validator/Var;

    if-eqz v5, :cond_4d

    .line 191
    check-cast v4, Lorg/apache/commons/validator/Var;

    .end local v4    # "value":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/apache/commons/validator/Var;->clone()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 193
    .restart local v4    # "value":Ljava/lang/Object;
    :cond_4d
    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 196
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_51
    return-object v3
.end method

.method public static getValueAsString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "bean"    # Ljava/lang/Object;
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 100
    const/4 v2, 0x0

    .line 103
    .local v2, "value":Ljava/lang/Object;
    :try_start_1
    invoke-static {p0, p1}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_4} :catch_9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_4} :catch_25
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_4} :catch_41

    move-result-object v2

    .line 116
    .end local v2    # "value":Ljava/lang/Object;
    :goto_5
    if-nez v2, :cond_5d

    .line 117
    const/4 v3, 0x0

    .line 127
    :goto_8
    return-object v3

    .line 105
    .restart local v2    # "value":Ljava/lang/Object;
    :catch_9
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    if-nez v3, :cond_22

    const-string v3, "org.apache.commons.validator.util.ValidatorUtils"

    invoke-static {v3}, Lorg/apache/commons/validator/util/ValidatorUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    :goto_16
    invoke-static {v3}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 107
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 106
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_22
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    goto :goto_16

    .line 108
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_25
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    if-nez v3, :cond_3e

    const-string v3, "org.apache.commons.validator.util.ValidatorUtils"

    invoke-static {v3}, Lorg/apache/commons/validator/util/ValidatorUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    :goto_32
    invoke-static {v3}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 110
    .restart local v1    # "log":Lorg/apache/commons/logging/Log;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 109
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_3e
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    goto :goto_32

    .line 111
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_41
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    if-nez v3, :cond_5a

    const-string v3, "org.apache.commons.validator.util.ValidatorUtils"

    invoke-static {v3}, Lorg/apache/commons/validator/util/ValidatorUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    :goto_4e
    invoke-static {v3}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 113
    .restart local v1    # "log":Lorg/apache/commons/logging/Log;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3, v0}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 112
    .end local v1    # "log":Lorg/apache/commons/logging/Log;
    :cond_5a
    sget-object v3, Lorg/apache/commons/validator/util/ValidatorUtils;->class$org$apache$commons$validator$util$ValidatorUtils:Ljava/lang/Class;

    goto :goto_4e

    .line 120
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_5d
    instance-of v3, v2, [Ljava/lang/String;

    if-eqz v3, :cond_71

    move-object v3, v2

    .line 121
    check-cast v3, [Ljava/lang/String;

    check-cast v3, [Ljava/lang/String;

    array-length v3, v3

    if-lez v3, :cond_6e

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_8

    :cond_6e
    const-string v3, ""

    goto :goto_8

    .line 123
    :cond_71
    instance-of v3, v2, Ljava/util/Collection;

    if-eqz v3, :cond_86

    move-object v3, v2

    .line 124
    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_81

    const-string v3, ""

    goto :goto_8

    :cond_81
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_8

    .line 127
    :cond_86
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_8
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "replaceValue"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 56
    if-eqz p0, :cond_7

    if-eqz p1, :cond_7

    if-nez p2, :cond_8

    .line 83
    :cond_7
    :goto_7
    return-object p0

    .line 60
    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 62
    .local v2, "pos":I
    if-ltz v2, :cond_7

    .line 66
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 67
    .local v1, "length":I
    move v3, v2

    .line 68
    .local v3, "start":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int v0, v2, v4

    .line 70
    .local v0, "end":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v1, v4, :cond_21

    .line 71
    move-object p0, p2

    goto :goto_7

    .line 73
    :cond_21
    if-ne v0, v1, :cond_39

    .line 74
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7

    .line 77
    :cond_39
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1, p2}, Lorg/apache/commons/validator/util/ValidatorUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_7
.end method
