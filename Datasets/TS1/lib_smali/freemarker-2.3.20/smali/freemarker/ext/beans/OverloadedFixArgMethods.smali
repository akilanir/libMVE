.class Lfreemarker/ext/beans/OverloadedFixArgMethods;
.super Lfreemarker/ext/beans/OverloadedMethodsSubset;
.source "OverloadedFixArgMethods.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Lfreemarker/ext/beans/OverloadedMethodsSubset;-><init>()V

    return-void
.end method


# virtual methods
.method afterSignatureAdded(I)V
    .registers 2
    .param p1, "l"    # I

    .prologue
    .line 74
    return-void
.end method

.method getMemberAndArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)Ljava/lang/Object;
    .registers 14
    .param p1, "tmArgs"    # Ljava/util/List;
    .param p2, "w"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 78
    if-nez p1, :cond_4

    .line 80
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 82
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 83
    .local v0, "argCount":I
    invoke-virtual {p0}, Lfreemarker/ext/beans/OverloadedFixArgMethods;->getUnwrappingArgTypesByArgCount()[[Ljava/lang/Class;

    move-result-object v8

    .line 84
    .local v8, "unwrappingArgTypesByArgCount":[[Ljava/lang/Class;
    array-length v9, v8

    if-gt v9, v0, :cond_12

    .line 85
    sget-object v4, Lfreemarker/ext/beans/OverloadedFixArgMethods;->NO_SUCH_METHOD:Ljava/lang/Object;

    .line 109
    :cond_11
    :goto_11
    return-object v4

    .line 87
    :cond_12
    aget-object v7, v8, v0

    .line 88
    .local v7, "unwarppingArgumentTypes":[Ljava/lang/Class;
    if-nez v7, :cond_19

    .line 89
    sget-object v4, Lfreemarker/ext/beans/OverloadedFixArgMethods;->NO_SUCH_METHOD:Ljava/lang/Object;

    goto :goto_11

    .line 93
    :cond_19
    new-array v6, v0, [Ljava/lang/Object;

    .line 94
    .local v6, "pojoArgs":[Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 95
    .local v2, "it":Ljava/util/Iterator;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_20
    if-ge v1, v0, :cond_3a

    .line 96
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lfreemarker/template/TemplateModel;

    aget-object v10, v7, v1

    invoke-virtual {p2, v9, v10}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 97
    .local v5, "pojo":Ljava/lang/Object;
    sget-object v9, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    if-ne v5, v9, :cond_35

    .line 98
    sget-object v4, Lfreemarker/ext/beans/OverloadedFixArgMethods;->NO_SUCH_METHOD:Ljava/lang/Object;

    goto :goto_11

    .line 100
    :cond_35
    aput-object v5, v6, v1

    .line 95
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    .line 103
    .end local v5    # "pojo":Ljava/lang/Object;
    :cond_3a
    const/4 v9, 0x0

    invoke-virtual {p0, v6, v9}, Lfreemarker/ext/beans/OverloadedFixArgMethods;->getMemberForArgs([Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v4

    .line 104
    .local v4, "objMember":Ljava/lang/Object;
    instance-of v9, v4, Ljava/lang/reflect/Member;

    if-eqz v9, :cond_11

    move-object v3, v4

    .line 105
    check-cast v3, Ljava/lang/reflect/Member;

    .line 106
    .local v3, "member":Ljava/lang/reflect/Member;
    invoke-virtual {p0, v3}, Lfreemarker/ext/beans/OverloadedFixArgMethods;->getSignature(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9, v6}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimals([Ljava/lang/Class;[Ljava/lang/Object;)V

    .line 107
    new-instance v4, Lfreemarker/ext/beans/MemberAndArguments;

    .end local v4    # "objMember":Ljava/lang/Object;
    invoke-direct {v4, v3, v6}, Lfreemarker/ext/beans/MemberAndArguments;-><init>(Ljava/lang/reflect/Member;[Ljava/lang/Object;)V

    goto :goto_11
.end method

.method onAddSignature(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V
    .registers 3
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .param p2, "argTypes"    # [Ljava/lang/Class;

    .prologue
    .line 68
    return-void
.end method

.method updateSignature(I)V
    .registers 2
    .param p1, "l"    # I

    .prologue
    .line 71
    return-void
.end method
