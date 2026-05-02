.class Lfreemarker/ext/beans/OverloadedVarargMethods;
.super Lfreemarker/ext/beans/OverloadedMethodsSubset;
.source "OverloadedVarArgMethod.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    }
.end annotation


# static fields
.field private static final canoncialArgPackers:Ljava/util/Map;


# instance fields
.field private final argPackers:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/OverloadedVarargMethods;->canoncialArgPackers:Ljava/util/Map;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 68
    invoke-direct {p0}, Lfreemarker/ext/beans/OverloadedMethodsSubset;-><init>()V

    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedVarargMethods;->argPackers:Ljava/util/Map;

    .line 74
    return-void
.end method

.method private static componentizeLastType([Ljava/lang/Class;)V
    .registers 3
    .param p0, "types"    # [Ljava/lang/Class;

    .prologue
    .line 204
    array-length v1, p0

    add-int/lit8 v0, v1, -0x1

    .line 207
    .local v0, "l1":I
    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    aput-object v1, p0, v0

    .line 208
    return-void
.end method

.method private static varArgUpdate([Ljava/lang/Class;[Ljava/lang/Class;)V
    .registers 9
    .param p0, "modifiedTypes"    # [Ljava/lang/Class;
    .param p1, "modifyingTypes"    # [Ljava/lang/Class;

    .prologue
    .line 187
    array-length v0, p0

    .line 188
    .local v0, "dl":I
    array-length v1, p1

    .line 189
    .local v1, "gl":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 190
    .local v3, "min":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v3, :cond_16

    .line 191
    aget-object v5, p0, v2

    aget-object v6, p1, v2

    invoke-static {v5, v6}, Lfreemarker/ext/beans/MethodUtilities;->getMostSpecificCommonType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    aput-object v5, p0, v2

    .line 190
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 194
    :cond_16
    if-le v0, v1, :cond_2a

    .line 195
    add-int/lit8 v5, v1, -0x1

    aget-object v4, p1, v5

    .line 196
    .local v4, "varArgType":Ljava/lang/Class;
    move v2, v1

    :goto_1d
    if-ge v2, v0, :cond_2a

    .line 197
    aget-object v5, p0, v2

    invoke-static {v5, v4}, Lfreemarker/ext/beans/MethodUtilities;->getMostSpecificCommonType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    aput-object v5, p0, v2

    .line 196
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 201
    .end local v4    # "varArgType":Ljava/lang/Class;
    :cond_2a
    return-void
.end method


# virtual methods
.method afterSignatureAdded(I)V
    .registers 8
    .param p1, "l"    # I

    .prologue
    .line 167
    invoke-virtual {p0}, Lfreemarker/ext/beans/OverloadedVarargMethods;->getUnwrappingArgTypesByArgCount()[[Ljava/lang/Class;

    move-result-object v2

    .line 168
    .local v2, "marshalTypes":[[Ljava/lang/Class;
    aget-object v3, v2, p1

    .line 169
    .local v3, "newTypes":[Ljava/lang/Class;
    add-int/lit8 v1, p1, 0x1

    .local v1, "i":I
    :goto_8
    array-length v5, v2

    if-ge v1, v5, :cond_15

    .line 170
    aget-object v0, v2, v1

    .line 171
    .local v0, "existingTypes":[Ljava/lang/Class;
    if-eqz v0, :cond_12

    .line 172
    invoke-static {v0, v3}, Lfreemarker/ext/beans/OverloadedVarargMethods;->varArgUpdate([Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 169
    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 178
    .end local v0    # "existingTypes":[Ljava/lang/Class;
    :cond_15
    if-lez p1, :cond_20

    .line 179
    add-int/lit8 v5, p1, -0x1

    aget-object v4, v2, v5

    .line 180
    .local v4, "oneShorterTypes":[Ljava/lang/Class;
    if-eqz v4, :cond_20

    .line 181
    invoke-static {v4, v3}, Lfreemarker/ext/beans/OverloadedVarargMethods;->varArgUpdate([Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 184
    .end local v4    # "oneShorterTypes":[Ljava/lang/Class;
    :cond_20
    return-void
.end method

.method getMemberAndArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)Ljava/lang/Object;
    .registers 15
    .param p1, "tmArgs"    # Ljava/util/List;
    .param p2, "w"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 212
    if-nez p1, :cond_4

    .line 214
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 216
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    .line 217
    .local v3, "l":I
    invoke-virtual {p0}, Lfreemarker/ext/beans/OverloadedVarargMethods;->getUnwrappingArgTypesByArgCount()[[Ljava/lang/Class;

    move-result-object v9

    .line 218
    .local v9, "unwrappingArgTypesByArgCount":[[Ljava/lang/Class;
    new-array v7, v3, [Ljava/lang/Object;

    .line 222
    .local v7, "pojoArgs":[Ljava/lang/Object;
    add-int/lit8 v10, v3, 0x1

    array-length v11, v9

    add-int/lit8 v11, v11, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v2

    .local v2, "j":I
    :goto_17
    if-ltz v2, :cond_4c

    .line 223
    aget-object v8, v9, v2

    .line 224
    .local v8, "unwarappingArgTypes":[Ljava/lang/Class;
    if-nez v8, :cond_22

    .line 225
    if-nez v2, :cond_3b

    .line 226
    sget-object v5, Lfreemarker/ext/beans/OverloadedVarargMethods;->NO_SUCH_METHOD:Ljava/lang/Object;

    .line 254
    .end local v8    # "unwarappingArgTypes":[Ljava/lang/Class;
    :cond_21
    :goto_21
    return-object v5

    .line 231
    .restart local v8    # "unwarappingArgTypes":[Ljava/lang/Class;
    :cond_22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 232
    .local v1, "it":Ljava/util/Iterator;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_27
    if-ge v0, v3, :cond_4c

    .line 233
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lfreemarker/template/TemplateModel;

    if-ge v0, v2, :cond_3e

    aget-object v11, v8, v0

    :goto_33
    invoke-virtual {p2, v10, v11}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    .line 234
    .local v6, "pojo":Ljava/lang/Object;
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    if-ne v6, v10, :cond_43

    .line 222
    .end local v0    # "i":I
    .end local v1    # "it":Ljava/util/Iterator;
    .end local v6    # "pojo":Ljava/lang/Object;
    :cond_3b
    add-int/lit8 v2, v2, -0x1

    goto :goto_17

    .line 233
    .restart local v0    # "i":I
    .restart local v1    # "it":Ljava/util/Iterator;
    :cond_3e
    add-int/lit8 v11, v2, -0x1

    aget-object v11, v8, v11

    goto :goto_33

    .line 237
    .restart local v6    # "pojo":Ljava/lang/Object;
    :cond_43
    aget-object v10, v7, v0

    if-eq v6, v10, :cond_49

    .line 238
    aput-object v6, v7, v0

    .line 232
    :cond_49
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 244
    .end local v0    # "i":I
    .end local v1    # "it":Ljava/util/Iterator;
    .end local v6    # "pojo":Ljava/lang/Object;
    .end local v8    # "unwarappingArgTypes":[Ljava/lang/Class;
    :cond_4c
    const/4 v10, 0x1

    invoke-virtual {p0, v7, v10}, Lfreemarker/ext/beans/OverloadedVarargMethods;->getMemberForArgs([Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v5

    .line 245
    .local v5, "objMember":Ljava/lang/Object;
    instance-of v10, v5, Ljava/lang/reflect/Member;

    if-eqz v10, :cond_21

    move-object v4, v5

    .line 246
    check-cast v4, Ljava/lang/reflect/Member;

    .line 247
    .local v4, "member":Ljava/lang/reflect/Member;
    iget-object v10, p0, Lfreemarker/ext/beans/OverloadedVarargMethods;->argPackers:Ljava/util/Map;

    invoke-interface {v10, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;

    invoke-virtual {v10, v7, p1, p2}, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->packArgs([Ljava/lang/Object;Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;

    move-result-object v7

    .line 248
    if-nez v7, :cond_69

    .line 249
    sget-object v5, Lfreemarker/ext/beans/OverloadedVarargMethods;->NO_SUCH_METHOD:Ljava/lang/Object;

    goto :goto_21

    .line 251
    :cond_69
    invoke-virtual {p0, v4}, Lfreemarker/ext/beans/OverloadedVarargMethods;->getSignature(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v10

    invoke-static {v10, v7}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimals([Ljava/lang/Class;[Ljava/lang/Object;)V

    .line 252
    new-instance v5, Lfreemarker/ext/beans/MemberAndArguments;

    .end local v5    # "objMember":Ljava/lang/Object;
    invoke-direct {v5, v4, v7}, Lfreemarker/ext/beans/MemberAndArguments;-><init>(Ljava/lang/reflect/Member;[Ljava/lang/Object;)V

    goto :goto_21
.end method

.method onAddSignature(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V
    .registers 7
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .param p2, "argTypes"    # [Ljava/lang/Class;

    .prologue
    .line 127
    new-instance v0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;

    invoke-direct {v0, p2}, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;-><init>([Ljava/lang/Class;)V

    .line 128
    .local v0, "argPacker":Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    sget-object v3, Lfreemarker/ext/beans/OverloadedVarargMethods;->canoncialArgPackers:Ljava/util/Map;

    monitor-enter v3

    .line 129
    :try_start_8
    sget-object v2, Lfreemarker/ext/beans/OverloadedVarargMethods;->canoncialArgPackers:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;

    .line 131
    .local v1, "canonical":Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    if-nez v1, :cond_21

    .line 132
    sget-object v2, Lfreemarker/ext/beans/OverloadedVarargMethods;->canoncialArgPackers:Ljava/util/Map;

    invoke-interface {v2, v0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :goto_17
    monitor-exit v3
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_23

    .line 138
    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedVarargMethods;->argPackers:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    invoke-static {p2}, Lfreemarker/ext/beans/OverloadedVarargMethods;->componentizeLastType([Ljava/lang/Class;)V

    .line 140
    return-void

    .line 135
    :cond_21
    move-object v0, v1

    goto :goto_17

    .line 137
    .end local v1    # "canonical":Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    :catchall_23
    move-exception v2

    :try_start_24
    monitor-exit v3
    :try_end_25
    .catchall {:try_start_24 .. :try_end_25} :catchall_23

    throw v2
.end method

.method updateSignature(I)V
    .registers 10
    .param p1, "l"    # I

    .prologue
    .line 143
    invoke-virtual {p0}, Lfreemarker/ext/beans/OverloadedVarargMethods;->getUnwrappingArgTypesByArgCount()[[Ljava/lang/Class;

    move-result-object v2

    .line 144
    .local v2, "marshalTypes":[[Ljava/lang/Class;
    aget-object v3, v2, p1

    .line 147
    .local v3, "newTypes":[Ljava/lang/Class;
    move v0, p1

    .local v0, "i":I
    move v1, v0

    .end local v0    # "i":I
    .local v1, "i":I
    :goto_8
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "i":I
    .restart local v0    # "i":I
    if-lez v1, :cond_13

    .line 148
    aget-object v5, v2, v0

    .line 149
    .local v5, "previousTypes":[Ljava/lang/Class;
    if-eqz v5, :cond_22

    .line 150
    invoke-static {v3, v5}, Lfreemarker/ext/beans/OverloadedVarargMethods;->varArgUpdate([Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 156
    .end local v5    # "previousTypes":[Ljava/lang/Class;
    :cond_13
    add-int/lit8 v6, p1, 0x1

    array-length v7, v2

    if-ge v6, v7, :cond_21

    .line 157
    add-int/lit8 v6, p1, 0x1

    aget-object v4, v2, v6

    .line 158
    .local v4, "oneLongerTypes":[Ljava/lang/Class;
    if-eqz v4, :cond_21

    .line 159
    invoke-static {v3, v4}, Lfreemarker/ext/beans/OverloadedVarargMethods;->varArgUpdate([Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 162
    .end local v4    # "oneLongerTypes":[Ljava/lang/Class;
    :cond_21
    return-void

    .restart local v5    # "previousTypes":[Ljava/lang/Class;
    :cond_22
    move v1, v0

    .line 153
    .end local v0    # "i":I
    .restart local v1    # "i":I
    goto :goto_8
.end method
