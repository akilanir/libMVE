.class final Lfreemarker/ext/beans/OverloadedMethods;
.super Ljava/lang/Object;
.source "OverloadedMethods.java"


# instance fields
.field private final fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

.field private varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

.field private final wrapper:Lfreemarker/ext/beans/BeansWrapper;


# direct methods
.method constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Lfreemarker/ext/beans/OverloadedFixArgMethods;

    invoke-direct {v0}, Lfreemarker/ext/beans/OverloadedFixArgMethods;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    .line 75
    iput-object p1, p0, Lfreemarker/ext/beans/OverloadedMethods;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    .line 76
    return-void
.end method

.method private getDeducedCallSignature(Ljava/util/List;)Ljava/lang/String;
    .registers 8
    .param p1, "arguments"    # Ljava/util/List;

    .prologue
    .line 144
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethods;->fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v5}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMembers()Ljava/util/Iterator;

    move-result-object v1

    .line 145
    .local v1, "fixArgMethodsIter":Ljava/util/Iterator;
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 146
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Member;

    .line 156
    .local v0, "firstMember":Ljava/lang/reflect/Member;
    :goto_12
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 157
    .local v3, "sb":Ljava/lang/StringBuffer;
    if-eqz v0, :cond_6f

    .line 158
    instance-of v5, v0, Ljava/lang/reflect/Constructor;

    if-eqz v5, :cond_69

    .line 159
    const-string v5, "constructor "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    :goto_22
    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 168
    :goto_29
    const/16 v5, 0x28

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 169
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2f
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_75

    .line 170
    if-eqz v2, :cond_3c

    const-string v5, ", "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    :cond_3c
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/template/TemplateModel;

    invoke-static {v5}, Lfreemarker/template/utility/ClassUtil;->getFTLTypeDescription(Lfreemarker/template/TemplateModel;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 169
    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    .line 148
    .end local v0    # "firstMember":Ljava/lang/reflect/Member;
    .end local v2    # "i":I
    .end local v3    # "sb":Ljava/lang/StringBuffer;
    :cond_4c
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    if-eqz v5, :cond_65

    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v5}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMembers()Ljava/util/Iterator;

    move-result-object v4

    .line 149
    .local v4, "varArgMethods":Ljava/util/Iterator;
    :goto_56
    if-eqz v4, :cond_67

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_67

    .line 150
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Member;

    .restart local v0    # "firstMember":Ljava/lang/reflect/Member;
    goto :goto_12

    .line 148
    .end local v0    # "firstMember":Ljava/lang/reflect/Member;
    .end local v4    # "varArgMethods":Ljava/util/Iterator;
    :cond_65
    const/4 v4, 0x0

    goto :goto_56

    .line 152
    .restart local v4    # "varArgMethods":Ljava/util/Iterator;
    :cond_67
    const/4 v0, 0x0

    .restart local v0    # "firstMember":Ljava/lang/reflect/Member;
    goto :goto_12

    .line 161
    .end local v4    # "varArgMethods":Ljava/util/Iterator;
    .restart local v3    # "sb":Ljava/lang/StringBuffer;
    :cond_69
    const-string v5, "method "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_22

    .line 165
    :cond_6f
    const-string v5, "???"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_29

    .line 173
    .restart local v2    # "i":I
    :cond_75
    const/16 v5, 0x29

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private memberListToString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 116
    iget-object v4, p0, Lfreemarker/ext/beans/OverloadedMethods;->fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v4}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMembers()Ljava/util/Iterator;

    move-result-object v0

    .line 117
    .local v0, "fixArgMethodsIter":Ljava/util/Iterator;
    iget-object v4, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    if-eqz v4, :cond_4a

    iget-object v4, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v4}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMembers()Ljava/util/Iterator;

    move-result-object v3

    .line 119
    .local v3, "varargMethodsIter":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1e

    if-eqz v3, :cond_4c

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4c

    :cond_1e
    const/4 v1, 0x1

    .line 120
    .local v1, "hasMethods":Z
    :goto_1f
    if-eqz v1, :cond_74

    .line 121
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 122
    .local v2, "sb":Ljava/lang/StringBuffer;
    :goto_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 123
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-eqz v4, :cond_37

    const-string v4, ",\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    :cond_37
    const-string v4, "    "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Member;

    invoke-direct {p0, v4}, Lfreemarker/ext/beans/OverloadedMethods;->methodOrConstructorToString(Ljava/lang/reflect/Member;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_26

    .line 117
    .end local v1    # "hasMethods":Z
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    .end local v3    # "varargMethodsIter":Ljava/util/Iterator;
    :cond_4a
    const/4 v3, 0x0

    goto :goto_10

    .line 119
    .restart local v3    # "varargMethodsIter":Ljava/util/Iterator;
    :cond_4c
    const/4 v1, 0x0

    goto :goto_1f

    .line 127
    .restart local v1    # "hasMethods":Z
    .restart local v2    # "sb":Ljava/lang/StringBuffer;
    :cond_4e
    if-eqz v3, :cond_6f

    .line 128
    :goto_50
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6f

    .line 129
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-eqz v4, :cond_61

    const-string v4, ",\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    :cond_61
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Member;

    invoke-direct {p0, v4}, Lfreemarker/ext/beans/OverloadedMethods;->methodOrConstructorToString(Ljava/lang/reflect/Member;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_50

    .line 133
    :cond_6f
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 135
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    :goto_73
    return-object v4

    :cond_74
    const-string v4, "No members"

    goto :goto_73
.end method

.method private methodOrConstructorToString(Ljava/lang/reflect/Member;)Ljava/lang/String;
    .registers 7
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 183
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 185
    .local v3, "sb":Ljava/lang/StringBuffer;
    invoke-interface {p1}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "className":Ljava/lang/String;
    if-eqz v0, :cond_17

    .line 187
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 188
    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 190
    :cond_17
    invoke-interface {p1}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    const/16 v4, 0x28

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 193
    invoke-static {p1}, Lfreemarker/ext/beans/MethodUtilities;->getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v2

    .line 194
    .local v2, "paramTypes":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_28
    array-length v4, v2

    if-ge v1, v4, :cond_3e

    .line 195
    if-eqz v1, :cond_32

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 196
    :cond_32
    aget-object v4, v2, v1

    invoke-static {v4}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 194
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 198
    :cond_3e
    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 200
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method addMember(Ljava/lang/reflect/Member;)V
    .registers 3
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 83
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->addMember(Ljava/lang/reflect/Member;)V

    .line 84
    invoke-static {p1}, Lfreemarker/ext/beans/MethodUtilities;->isVarArgs(Ljava/lang/reflect/Member;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 85
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    if-nez v0, :cond_16

    .line 86
    new-instance v0, Lfreemarker/ext/beans/OverloadedVarargMethods;

    invoke-direct {v0}, Lfreemarker/ext/beans/OverloadedVarargMethods;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    .line 88
    :cond_16
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->addMember(Ljava/lang/reflect/Member;)V

    .line 90
    :cond_1b
    return-void
.end method

.method getMemberAndArguments(Ljava/util/List;)Lfreemarker/ext/beans/MemberAndArguments;
    .registers 6
    .param p1, "tmArgs"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v1, p0, Lfreemarker/ext/beans/OverloadedMethods;->fixArgMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedMethods;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v1, p1, v2}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMemberAndArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)Ljava/lang/Object;

    move-result-object v0

    .line 95
    .local v0, "memberAndArguments":Ljava/lang/Object;
    sget-object v1, Lfreemarker/ext/beans/OverloadedMethodsSubset;->NO_SUCH_METHOD:Ljava/lang/Object;

    if-ne v0, v1, :cond_47

    .line 96
    iget-object v1, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    if-eqz v1, :cond_18

    .line 97
    iget-object v1, p0, Lfreemarker/ext/beans/OverloadedMethods;->varargMethods:Lfreemarker/ext/beans/OverloadedMethodsSubset;

    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedMethods;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v1, p1, v2}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->getMemberAndArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)Ljava/lang/Object;

    move-result-object v0

    .line 99
    :cond_18
    sget-object v1, Lfreemarker/ext/beans/OverloadedMethodsSubset;->NO_SUCH_METHOD:Ljava/lang/Object;

    if-ne v0, v1, :cond_47

    .line 100
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No compatible overloaded variation was found for the signature deducated from the actual parameter values:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-direct {p0, p1}, Lfreemarker/ext/beans/OverloadedMethods;->getDeducedCallSignature(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\nThe available overloaded variations are:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-direct {p0}, Lfreemarker/ext/beans/OverloadedMethods;->memberListToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_47
    sget-object v1, Lfreemarker/ext/beans/OverloadedMethodsSubset;->AMBIGUOUS_METHOD:Ljava/lang/Object;

    if-ne v0, v1, :cond_76

    .line 107
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Multiple compatible overloaded variation was found for the signature deducated from the actual parameter values:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-direct {p0, p1}, Lfreemarker/ext/beans/OverloadedMethods;->getDeducedCallSignature(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\nThe available overloaded variations are (including non-matching):\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-direct {p0}, Lfreemarker/ext/beans/OverloadedMethods;->memberListToString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_76
    check-cast v0, Lfreemarker/ext/beans/MemberAndArguments;

    .end local v0    # "memberAndArguments":Ljava/lang/Object;
    return-object v0
.end method

.method getWrapper()Lfreemarker/ext/beans/BeansWrapper;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethods;->wrapper:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method
