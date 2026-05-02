.class public abstract Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;
.super Ljava/lang/Object;
.source "FieldDeserializer.java"


# instance fields
.field protected final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public final fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/alibaba/fastjson/util/FieldInfo;)V
    .registers 3
    .param p2, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->clazz:Ljava/lang/Class;

    .line 24
    iput-object p2, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    .line 25
    return-void
.end method


# virtual methods
.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 31
    const/4 v0, 0x0

    return v0
.end method

.method public abstract parseField(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public setValue(Ljava/lang/Object;I)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "value"    # I

    .prologue
    .line 39
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    return-void
.end method

.method public setValue(Ljava/lang/Object;J)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "value"    # J

    .prologue
    .line 43
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 12
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 52
    if-nez p2, :cond_d

    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 53
    invoke-virtual {v6}, Ljava/lang/Class;->isPrimitive()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 130
    .end local p2    # "value":Ljava/lang/Object;
    :cond_c
    :goto_c
    return-void

    .line 58
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_d
    :try_start_d
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v5, v6, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 59
    .local v5, "method":Ljava/lang/reflect/Method;
    if-eqz v5, :cond_ca

    .line 60
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-boolean v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    if-eqz v6, :cond_bf

    .line 61
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicInteger;

    if-ne v6, v7, :cond_54

    .line 62
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 63
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicInteger;
    if-eqz v0, :cond_c

    .line 64
    check-cast p2, Ljava/util/concurrent/atomic/AtomicInteger;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_35} :catch_36

    goto :goto_c

    .line 127
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v5    # "method":Ljava/lang/reflect/Method;
    :catch_36
    move-exception v2

    .line 128
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Lcom/alibaba/fastjson/JSONException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "set property error, "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v8, v8, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 66
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v5    # "method":Ljava/lang/reflect/Method;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_54
    :try_start_54
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicLong;

    if-ne v6, v7, :cond_71

    .line 67
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 68
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v0, :cond_c

    .line 69
    check-cast p2, Ljava/util/concurrent/atomic/AtomicLong;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto :goto_c

    .line 71
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicLong;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_71
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicBoolean;

    if-ne v6, v7, :cond_8f

    .line 72
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 73
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicBoolean;
    if-eqz v0, :cond_c

    .line 74
    check-cast p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v6

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_c

    .line 76
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_8f
    const-class v6, Ljava/util/Map;

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_ad

    .line 77
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 78
    .local v4, "map":Ljava/util/Map;
    if-eqz v4, :cond_c

    .line 79
    check-cast p2, Ljava/util/Map;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {v4, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    goto/16 :goto_c

    .line 82
    .end local v4    # "map":Ljava/util/Map;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_ad
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 83
    .local v1, "collection":Ljava/util/Collection;
    if-eqz v1, :cond_c

    .line 84
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {v1, p2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_c

    .line 88
    .end local v1    # "collection":Ljava/util/Collection;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_bf
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-virtual {v5, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_c

    .line 92
    :cond_ca
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v3, v6, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    .line 94
    .local v3, "field":Ljava/lang/reflect/Field;
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-boolean v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->getOnly:Z

    if-eqz v6, :cond_14f

    .line 95
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicInteger;

    if-ne v6, v7, :cond_ef

    .line 96
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 97
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicInteger;
    if-eqz v0, :cond_c

    .line 98
    check-cast p2, Ljava/util/concurrent/atomic/AtomicInteger;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    goto/16 :goto_c

    .line 100
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicInteger;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_ef
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicLong;

    if-ne v6, v7, :cond_10a

    .line 101
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 102
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicLong;
    if-eqz v0, :cond_c

    .line 103
    check-cast p2, Ljava/util/concurrent/atomic/AtomicLong;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    goto/16 :goto_c

    .line 105
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicLong;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_10a
    iget-object v6, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v6, v6, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v7, Ljava/util/concurrent/atomic/AtomicBoolean;

    if-ne v6, v7, :cond_125

    .line 106
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 107
    .local v0, "atomic":Ljava/util/concurrent/atomic/AtomicBoolean;
    if-eqz v0, :cond_c

    .line 108
    check-cast p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v6

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_c

    .line 110
    .end local v0    # "atomic":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_125
    const-class v6, Ljava/util/Map;

    iget-object v7, p0, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->fieldInfo:Lcom/alibaba/fastjson/util/FieldInfo;

    iget-object v7, v7, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_140

    .line 111
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 112
    .restart local v4    # "map":Ljava/util/Map;
    if-eqz v4, :cond_c

    .line 113
    check-cast p2, Ljava/util/Map;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {v4, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    goto/16 :goto_c

    .line 116
    .end local v4    # "map":Ljava/util/Map;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_140
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    .line 117
    .restart local v1    # "collection":Ljava/util/Collection;
    if-eqz v1, :cond_c

    .line 118
    check-cast p2, Ljava/util/Collection;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {v1, p2}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_c

    .line 122
    .end local v1    # "collection":Ljava/util/Collection;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_14f
    if-eqz v3, :cond_c

    .line 123
    invoke-virtual {v3, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_154
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_154} :catch_36

    goto/16 :goto_c
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    return-void
.end method

.method public setValue(Ljava/lang/Object;Z)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "value"    # Z

    .prologue
    .line 35
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/parser/deserializer/FieldDeserializer;->setValue(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    return-void
.end method
