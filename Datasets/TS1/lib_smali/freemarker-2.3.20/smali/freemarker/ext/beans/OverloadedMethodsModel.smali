.class public Lfreemarker/ext/beans/OverloadedMethodsModel;
.super Ljava/lang/Object;
.source "OverloadedMethodsModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private final object:Ljava/lang/Object;

.field private final overloadedMethods:Lfreemarker/ext/beans/OverloadedMethods;


# direct methods
.method constructor <init>(Ljava/lang/Object;Lfreemarker/ext/beans/OverloadedMethods;)V
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "overloadedMethods"    # Lfreemarker/ext/beans/OverloadedMethods;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object p1, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->object:Ljava/lang/Object;

    .line 86
    iput-object p2, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->overloadedMethods:Lfreemarker/ext/beans/OverloadedMethods;

    .line 87
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 13
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v8, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->overloadedMethods:Lfreemarker/ext/beans/OverloadedMethods;

    invoke-virtual {v8, p1}, Lfreemarker/ext/beans/OverloadedMethods;->getMemberAndArguments(Ljava/util/List;)Lfreemarker/ext/beans/MemberAndArguments;

    move-result-object v5

    .line 101
    .local v5, "maa":Lfreemarker/ext/beans/MemberAndArguments;
    invoke-virtual {v5}, Lfreemarker/ext/beans/MemberAndArguments;->getMember()Ljava/lang/reflect/Member;

    move-result-object v6

    check-cast v6, Ljava/lang/reflect/Method;

    .line 103
    .local v6, "method":Ljava/lang/reflect/Method;
    :try_start_c
    iget-object v8, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->overloadedMethods:Lfreemarker/ext/beans/OverloadedMethods;

    invoke-virtual {v8}, Lfreemarker/ext/beans/OverloadedMethods;->getWrapper()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v8

    iget-object v9, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->object:Ljava/lang/Object;

    invoke-virtual {v5}, Lfreemarker/ext/beans/MemberAndArguments;->getArgs()[Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v8, v9, v6, v10}, Lfreemarker/ext/beans/BeansWrapper;->invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_1b} :catch_1d

    move-result-object v8

    return-object v8

    .line 105
    :catch_1d
    move-exception v3

    .line 107
    .local v3, "e":Ljava/lang/Exception;
    :goto_1e
    instance-of v8, v3, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v8, :cond_31

    move-object v8, v3

    .line 109
    check-cast v8, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v8}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v7

    .line 110
    .local v7, "t":Ljava/lang/Throwable;
    instance-of v8, v7, Ljava/lang/Exception;

    if-eqz v8, :cond_31

    move-object v3, v7

    .line 112
    check-cast v3, Ljava/lang/Exception;

    .line 118
    goto :goto_1e

    .line 119
    .end local v7    # "t":Ljava/lang/Throwable;
    :cond_31
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v8

    and-int/lit8 v8, v8, 0x8

    if-eqz v8, :cond_58

    .line 121
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Method "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " threw an exception. See cause exception."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8

    .line 126
    :cond_58
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 127
    .local v2, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v5}, Lfreemarker/ext/beans/MemberAndArguments;->getArgs()[Ljava/lang/Object;

    move-result-object v1

    .line 128
    .local v1, "args":[Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_62
    array-length v8, v1

    if-ge v4, v8, :cond_80

    .line 130
    aget-object v0, v1, v4

    .line 131
    .local v0, "arg":Ljava/lang/Object;
    if-nez v0, :cond_77

    const-string v8, "null"

    :goto_6b
    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const/16 v9, 0x2c

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 128
    add-int/lit8 v4, v4, 0x1

    goto :goto_62

    .line 131
    :cond_77
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    goto :goto_6b

    .line 133
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_80
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Method "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " threw an exception when invoked on "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->object:Ljava/lang/Object;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " object "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;->object:Ljava/lang/Object;

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->tryToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " with arguments of types ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, "]. See cause exception."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lfreemarker/template/SimpleNumber;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/OverloadedMethodsModel;->exec(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method public size()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v0, Lfreemarker/template/TemplateModelException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "?size is unsupported for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
