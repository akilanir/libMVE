.class Lorg/mozilla/javascript/FieldAndMethods;
.super Lorg/mozilla/javascript/NativeJavaMethod;
.source "JavaMembers.java"


# static fields
.field static final serialVersionUID:J = -0x7ffca5a02b1fef53L


# instance fields
.field field:Ljava/lang/reflect/Field;

.field javaObject:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/Scriptable;[Lorg/mozilla/javascript/MemberBox;Ljava/lang/reflect/Field;)V
    .registers 5
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "methods"    # [Lorg/mozilla/javascript/MemberBox;
    .param p3, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 878
    invoke-direct {p0, p2}, Lorg/mozilla/javascript/NativeJavaMethod;-><init>([Lorg/mozilla/javascript/MemberBox;)V

    .line 879
    iput-object p3, p0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    .line 880
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/FieldAndMethods;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 881
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptableObject;->getFunctionPrototype(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/FieldAndMethods;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 882
    return-void
.end method


# virtual methods
.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 887
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->FunctionClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_5

    .line 903
    .end local p0    # "this":Lorg/mozilla/javascript/FieldAndMethods;
    :goto_4
    return-object p0

    .line 892
    .restart local p0    # "this":Lorg/mozilla/javascript/FieldAndMethods;
    :cond_5
    :try_start_5
    iget-object v4, p0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    iget-object v5, p0, Lorg/mozilla/javascript/FieldAndMethods;->javaObject:Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 893
    .local v2, "rval":Ljava/lang/Object;
    iget-object v4, p0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;
    :try_end_12
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_12} :catch_2b

    move-result-object v3

    .line 898
    .local v3, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    .line 899
    .local v1, "cx":Lorg/mozilla/javascript/Context;
    invoke-virtual {v1}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v4

    invoke-virtual {v4, v1, p0, v2, v3}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 900
    instance-of v4, v2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_29

    .line 901
    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    .end local v2    # "rval":Ljava/lang/Object;
    invoke-interface {v2, p1}, Lorg/mozilla/javascript/Scriptable;->getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "rval":Ljava/lang/Object;
    :cond_29
    move-object p0, v2

    .line 903
    goto :goto_4

    .line 894
    .end local v1    # "cx":Lorg/mozilla/javascript/Context;
    .end local v2    # "rval":Ljava/lang/Object;
    .end local v3    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_2b
    move-exception v0

    .line 895
    .local v0, "accEx":Ljava/lang/IllegalAccessException;
    const-string v4, "msg.java.internal.private"

    iget-object v5, p0, Lorg/mozilla/javascript/FieldAndMethods;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v4

    throw v4
.end method
