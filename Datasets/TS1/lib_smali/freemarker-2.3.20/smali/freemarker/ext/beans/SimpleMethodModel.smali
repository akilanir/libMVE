.class public final Lfreemarker/ext/beans/SimpleMethodModel;
.super Lfreemarker/ext/beans/SimpleMemberModel;
.source "SimpleMethodModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private final object:Ljava/lang/Object;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Class;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 5
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "argTypes"    # [Ljava/lang/Class;
    .param p4, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 93
    invoke-direct {p0, p2, p3}, Lfreemarker/ext/beans/SimpleMemberModel;-><init>(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V

    .line 94
    iput-object p1, p0, Lfreemarker/ext/beans/SimpleMethodModel;->object:Ljava/lang/Object;

    .line 95
    iput-object p4, p0, Lfreemarker/ext/beans/SimpleMethodModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 96
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 8
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 107
    :try_start_0
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMethodModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    iget-object v4, p0, Lfreemarker/ext/beans/SimpleMethodModel;->object:Ljava/lang/Object;

    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMethodModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    iget-object v5, p0, Lfreemarker/ext/beans/SimpleMethodModel;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {p0, p1, v5}, Lfreemarker/ext/beans/SimpleMethodModel;->unwrapArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v2, v5}, Lfreemarker/ext/beans/BeansWrapper;->invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_13
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_13} :catch_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_17

    move-result-object v2

    return-object v2

    .line 110
    :catch_15
    move-exception v0

    .line 112
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    throw v0

    .line 114
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :catch_17
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    :goto_18
    instance-of v2, v0, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v2, :cond_2b

    move-object v2, v0

    .line 118
    check-cast v2, Ljava/lang/reflect/InvocationTargetException;

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v1

    .line 119
    .local v1, "t":Ljava/lang/Throwable;
    instance-of v2, v1, Ljava/lang/Exception;

    if-eqz v2, :cond_2b

    move-object v0, v1

    .line 121
    check-cast v0, Ljava/lang/Exception;

    .line 127
    goto :goto_18

    .line 128
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_2b
    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMethodModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v2

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_5e

    .line 130
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMethodModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " threw an exception; see cause exception"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2

    .line 135
    :cond_5e
    new-instance v2, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMethodModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " threw an exception when invoked on "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/beans/SimpleMethodModel;->object:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " object "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/ext/beans/SimpleMethodModel;->object:Ljava/lang/Object;

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->tryToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ". See cause exception."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
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
    .line 147
    new-instance v0, Lfreemarker/template/SimpleNumber;

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/SimpleMethodModel;->exec(Ljava/util/List;)Ljava/lang/Object;

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
    .line 152
    new-instance v0, Lfreemarker/template/TemplateModelException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Getting the number of items or enumerating the items is not supported on this "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p0}, Lfreemarker/template/utility/ClassUtil;->getFTLTypeDescription(Lfreemarker/template/TemplateModel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " value.\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "Hint 1: Maybe you wanted to call this method first and then do something with its return value. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "Hint 2: Getting items by intex possibly works, hence it\'s a \"+sequence\"."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 162
    invoke-virtual {p0}, Lfreemarker/ext/beans/SimpleMethodModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
