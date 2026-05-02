.class Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
.super Ljava/lang/Object;
.source "OverloadedVarArgMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/beans/OverloadedVarargMethods;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ArgumentPacker"
.end annotation


# instance fields
.field private final argCount:I

.field private final varArgType:Ljava/lang/Class;


# direct methods
.method constructor <init>([Ljava/lang/Class;)V
    .registers 3
    .param p1, "argTypes"    # [Ljava/lang/Class;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    array-length v0, p1

    iput v0, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    .line 80
    iget v0, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    add-int/lit8 v0, v0, -0x1

    aget-object v0, p1, v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    .line 81
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 114
    instance-of v2, p1, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;

    if-eqz v2, :cond_15

    move-object v0, p1

    .line 115
    check-cast v0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;

    .line 116
    .local v0, "p":Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    iget v2, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    iget v3, v0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    if-ne v2, v3, :cond_15

    iget-object v2, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    iget-object v3, v0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    if-ne v2, v3, :cond_15

    const/4 v1, 0x1

    .line 118
    .end local v0    # "p":Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;
    :cond_15
    return v1
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 122
    iget v0, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    iget-object v1, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method packArgs([Ljava/lang/Object;Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;
    .registers 14
    .param p1, "args"    # [Ljava/lang/Object;
    .param p2, "modelArgs"    # Ljava/util/List;
    .param p3, "w"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v9, 0x0

    .line 85
    array-length v0, p1

    .line 86
    .local v0, "actualArgCount":I
    iget v6, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    add-int/lit8 v2, v6, -0x1

    .line 87
    .local v2, "fixArgCount":I
    array-length v6, p1

    iget v8, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    if-eq v6, v8, :cond_3b

    .line 88
    iget v6, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->argCount:I

    new-array v4, v6, [Ljava/lang/Object;

    .line 89
    .local v4, "newargs":[Ljava/lang/Object;
    invoke-static {p1, v9, v4, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    iget-object v6, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    sub-int v8, v0, v2

    invoke-static {v6, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 91
    .local v1, "array":Ljava/lang/Object;
    move v3, v2

    .local v3, "i":I
    :goto_1c
    if-ge v3, v0, :cond_38

    .line 92
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    iget-object v8, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    invoke-virtual {p3, v6, v8}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 93
    .local v5, "val":Ljava/lang/Object;
    sget-object v6, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    if-ne v5, v6, :cond_30

    move-object v4, v7

    .line 109
    .end local v1    # "array":Ljava/lang/Object;
    .end local v3    # "i":I
    .end local v4    # "newargs":[Ljava/lang/Object;
    .end local v5    # "val":Ljava/lang/Object;
    :goto_2f
    return-object v4

    .line 96
    .restart local v1    # "array":Ljava/lang/Object;
    .restart local v3    # "i":I
    .restart local v4    # "newargs":[Ljava/lang/Object;
    .restart local v5    # "val":Ljava/lang/Object;
    :cond_30
    sub-int v6, v3, v2

    invoke-static {v1, v6, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 91
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .line 98
    .end local v5    # "val":Ljava/lang/Object;
    :cond_38
    aput-object v1, v4, v2

    goto :goto_2f

    .line 102
    .end local v1    # "array":Ljava/lang/Object;
    .end local v3    # "i":I
    .end local v4    # "newargs":[Ljava/lang/Object;
    :cond_3b
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    iget-object v8, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    invoke-virtual {p3, v6, v8}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v5

    .line 103
    .restart local v5    # "val":Ljava/lang/Object;
    sget-object v6, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    if-ne v5, v6, :cond_4d

    move-object v4, v7

    .line 104
    goto :goto_2f

    .line 106
    :cond_4d
    iget-object v6, p0, Lfreemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker;->varArgType:Ljava/lang/Class;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 107
    .restart local v1    # "array":Ljava/lang/Object;
    invoke-static {v1, v9, v5}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 108
    aput-object v1, p1, v2

    move-object v4, p1

    .line 109
    goto :goto_2f
.end method
