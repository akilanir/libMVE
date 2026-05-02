.class abstract Lfreemarker/ext/beans/OverloadedMethodsSubset;
.super Ljava/lang/Object;
.source "OverloadedMethodsSubset.java"


# static fields
.field static final AMBIGUOUS_METHOD:Ljava/lang/Object;

.field static final EMPTY_ARGS:[Ljava/lang/Object;

.field static final NO_SUCH_METHOD:Ljava/lang/Object;


# instance fields
.field private final members:Ljava/util/List;

.field private final selectorCache:Ljava/util/Map;

.field private final signatures:Ljava/util/Map;

.field private unwrappingArgTypesByArgCount:[[Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->NO_SUCH_METHOD:Ljava/lang/Object;

    .line 68
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->AMBIGUOUS_METHOD:Ljava/lang/Object;

    .line 69
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->EMPTY_ARGS:[Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->selectorCache:Ljava/util/Map;

    .line 74
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->members:Ljava/util/List;

    .line 75
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->signatures:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method addMember(Ljava/lang/reflect/Member;)V
    .registers 10
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    const/4 v7, 0x0

    .line 78
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->members:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    invoke-static {p1}, Lfreemarker/ext/beans/MethodUtilities;->getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v1

    .line 81
    .local v1, "argTypes":[Ljava/lang/Class;
    array-length v0, v1

    .line 82
    .local v0, "argCount":I
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->signatures:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, p1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->onAddSignature(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V

    .line 86
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    if-nez v5, :cond_2c

    .line 87
    add-int/lit8 v5, v0, 0x1

    new-array v5, v5, [[Ljava/lang/Class;

    iput-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    .line 88
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    aput-object v1, v5, v0

    .line 107
    :cond_25
    :goto_25
    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->updateSignature(I)V

    .line 109
    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/OverloadedMethodsSubset;->afterSignatureAdded(I)V

    .line 110
    return-void

    .line 89
    :cond_2c
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    array-length v5, v5

    if-gt v5, v0, :cond_44

    .line 90
    add-int/lit8 v5, v0, 0x1

    new-array v3, v5, [[Ljava/lang/Class;

    .line 91
    .local v3, "newUnwrappingArgTypesByArgCount":[[Ljava/lang/Class;
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    iget-object v6, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    array-length v6, v6

    invoke-static {v5, v7, v3, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    iput-object v3, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    .line 93
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    aput-object v1, v5, v0

    goto :goto_25

    .line 95
    .end local v3    # "newUnwrappingArgTypesByArgCount":[[Ljava/lang/Class;
    :cond_44
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    aget-object v4, v5, v0

    .line 96
    .local v4, "oldUnwrappingArgTypes":[Ljava/lang/Class;
    if-nez v4, :cond_4f

    .line 97
    iget-object v5, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    aput-object v1, v5, v0

    goto :goto_25

    .line 99
    :cond_4f
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_50
    array-length v5, v4

    if-ge v2, v5, :cond_25

    .line 103
    aget-object v5, v4, v2

    aget-object v6, v1, v2

    invoke-static {v5, v6}, Lfreemarker/ext/beans/MethodUtilities;->getMostSpecificCommonType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    aput-object v5, v4, v2

    .line 99
    add-int/lit8 v2, v2, 0x1

    goto :goto_50
.end method

.method abstract afterSignatureAdded(I)V
.end method

.method abstract getMemberAndArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation
.end method

.method getMemberForArgs([Ljava/lang/Object;Z)Ljava/lang/Object;
    .registers 7
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "varArg"    # Z

    .prologue
    .line 121
    new-instance v0, Lfreemarker/ext/beans/ClassString;

    invoke-direct {v0, p1}, Lfreemarker/ext/beans/ClassString;-><init>([Ljava/lang/Object;)V

    .line 123
    .local v0, "argTypes":Lfreemarker/ext/beans/ClassString;
    iget-object v3, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->selectorCache:Ljava/util/Map;

    monitor-enter v3

    .line 124
    :try_start_8
    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->selectorCache:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 125
    .local v1, "objMember":Ljava/lang/Object;
    if-nez v1, :cond_1b

    .line 126
    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->members:Ljava/util/List;

    invoke-virtual {v0, v2, p2}, Lfreemarker/ext/beans/ClassString;->getMostSpecific(Ljava/util/List;Z)Ljava/lang/Object;

    move-result-object v1

    .line 127
    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->selectorCache:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_1b
    monitor-exit v3

    .line 130
    return-object v1

    .line 129
    .end local v1    # "objMember":Ljava/lang/Object;
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_8 .. :try_end_1f} :catchall_1d

    throw v2
.end method

.method getMembers()Ljava/util/Iterator;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->members:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method getSignature(Ljava/lang/reflect/Member;)[Ljava/lang/Class;
    .registers 3
    .param p1, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 113
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->signatures:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    check-cast v0, [Ljava/lang/Class;

    return-object v0
.end method

.method getUnwrappingArgTypesByArgCount()[[Ljava/lang/Class;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lfreemarker/ext/beans/OverloadedMethodsSubset;->unwrappingArgTypesByArgCount:[[Ljava/lang/Class;

    return-object v0
.end method

.method abstract onAddSignature(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V
.end method

.method abstract updateSignature(I)V
.end method
