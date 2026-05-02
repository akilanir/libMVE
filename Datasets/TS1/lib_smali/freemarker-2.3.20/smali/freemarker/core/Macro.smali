.class public final Lfreemarker/core/Macro;
.super Lfreemarker/core/TemplateElement;
.source "Macro.java"

# interfaces
.implements Lfreemarker/template/TemplateModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/Macro$Context;
    }
.end annotation


# static fields
.field static final DO_NOTHING_MACRO:Lfreemarker/core/Macro;


# instance fields
.field final TYPE_FUNCTION:I

.field final TYPE_MACRO:I

.field private catchAllParamName:Ljava/lang/String;

.field isFunction:Z

.field private final name:Ljava/lang/String;

.field private paramDefaults:Ljava/util/Map;

.field private final paramNames:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 81
    new-instance v0, Lfreemarker/core/Macro;

    const-string v1, ".pass"

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sget-object v3, Lfreemarker/template/utility/Collections12;->EMPTY_MAP:Ljava/util/Map;

    sget-object v4, Lfreemarker/core/TextBlock;->EMPTY_BLOCK:Lfreemarker/core/TextBlock;

    invoke-direct {v0, v1, v2, v3, v4}, Lfreemarker/core/Macro;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lfreemarker/core/TemplateElement;)V

    sput-object v0, Lfreemarker/core/Macro;->DO_NOTHING_MACRO:Lfreemarker/core/Macro;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/Map;Lfreemarker/core/TemplateElement;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "argumentNames"    # Ljava/util/List;
    .param p3, "args"    # Ljava/util/Map;
    .param p4, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 88
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput v0, p0, Lfreemarker/core/Macro;->TYPE_MACRO:I

    .line 74
    const/4 v0, 0x1

    iput v0, p0, Lfreemarker/core/Macro;->TYPE_FUNCTION:I

    .line 89
    iput-object p1, p0, Lfreemarker/core/Macro;->name:Ljava/lang/String;

    .line 90
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    .line 92
    iput-object p3, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    .line 93
    iput-object p4, p0, Lfreemarker/core/Macro;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 94
    return-void
.end method

.method static access$000(Lfreemarker/core/Macro;)[Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Macro;

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    return-object v0
.end method

.method static access$100(Lfreemarker/core/Macro;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Macro;

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    return-object v0
.end method

.method static access$200(Lfreemarker/core/Macro;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Macro;

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/core/Macro;->name:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 121
    invoke-virtual {p1, p0}, Lfreemarker/core/Environment;->visitMacroDef(Lfreemarker/core/Macro;)V

    .line 122
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 10
    .param p1, "canonical"    # Z

    .prologue
    const/16 v7, 0x3e

    const/16 v6, 0x20

    .line 125
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 126
    .local v4, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_10

    const/16 v5, 0x3c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 127
    :cond_10
    invoke-virtual {p0}, Lfreemarker/core/Macro;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 129
    iget-object v5, p0, Lfreemarker/core/Macro;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    iget-boolean v5, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v5, :cond_67

    const/16 v5, 0x28

    :goto_25
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 131
    iget-object v5, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    array-length v0, v5

    .line 132
    .local v0, "argCnt":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2c
    if-ge v3, v0, :cond_71

    .line 133
    if-eqz v3, :cond_39

    .line 134
    iget-boolean v5, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v5, :cond_69

    .line 135
    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    :cond_39
    :goto_39
    iget-object v5, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    aget-object v1, v5, v3

    .line 141
    .local v1, "argName":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 142
    iget-object v5, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    if-eqz v5, :cond_64

    iget-object v5, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_64

    .line 143
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 144
    iget-object v5, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .line 145
    .local v2, "defaultExpr":Lfreemarker/core/Expression;
    iget-boolean v5, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v5, :cond_6d

    .line 146
    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 132
    .end local v2    # "defaultExpr":Lfreemarker/core/Expression;
    :cond_64
    :goto_64
    add-int/lit8 v3, v3, 0x1

    goto :goto_2c

    .end local v0    # "argCnt":I
    .end local v1    # "argName":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_67
    move v5, v6

    .line 130
    goto :goto_25

    .line 137
    .restart local v0    # "argCnt":I
    .restart local v3    # "i":I
    :cond_69
    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_39

    .line 148
    .restart local v1    # "argName":Ljava/lang/String;
    .restart local v2    # "defaultExpr":Lfreemarker/core/Expression;
    :cond_6d
    invoke-static {v4, v2}, Lfreemarker/core/MessageUtil;->appendExpressionAsUntearable(Ljava/lang/StringBuffer;Lfreemarker/core/Expression;)Ljava/lang/StringBuffer;

    goto :goto_64

    .line 152
    .end local v1    # "argName":Ljava/lang/String;
    .end local v2    # "defaultExpr":Lfreemarker/core/Expression;
    :cond_71
    iget-object v5, p0, Lfreemarker/core/Macro;->catchAllParamName:Ljava/lang/String;

    if-eqz v5, :cond_86

    .line 153
    if-eqz v0, :cond_7c

    const-string v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    :cond_7c
    iget-object v5, p0, Lfreemarker/core/Macro;->catchAllParamName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 155
    const-string v5, "..."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 157
    :cond_86
    iget-boolean v5, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v5, :cond_8f

    const/16 v5, 0x29

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 158
    :cond_8f
    if-eqz p1, :cond_b2

    .line 159
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 160
    iget-object v5, p0, Lfreemarker/core/Macro;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v5, :cond_a1

    .line 161
    iget-object v5, p0, Lfreemarker/core/Macro;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v5}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 163
    :cond_a1
    const-string v5, "</"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0}, Lfreemarker/core/Macro;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 165
    :cond_b2
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getArgumentNames()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method getArgumentNamesInternal()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    return-object v0
.end method

.method public getCatchAll()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lfreemarker/core/Macro;->catchAllParamName:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lfreemarker/core/Macro;->name:Ljava/lang/String;

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-boolean v0, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v0, :cond_7

    const-string v0, "#function"

    :goto_6
    return-object v0

    :cond_7
    const-string v0, "#macro"

    goto :goto_6
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 337
    if-nez p1, :cond_5

    .line 338
    sget-object v1, Lfreemarker/core/ParameterRole;->ASSIGNMENT_TARGET:Lfreemarker/core/ParameterRole;

    .line 350
    :goto_4
    return-object v1

    .line 340
    :cond_5
    iget-object v1, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v0, v1, 0x1

    .line 341
    .local v0, "argDescsEnd":I
    if-ge p1, v0, :cond_18

    .line 342
    rem-int/lit8 v1, p1, 0x2

    if-eqz v1, :cond_15

    .line 343
    sget-object v1, Lfreemarker/core/ParameterRole;->PARAMETER_NAME:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 345
    :cond_15
    sget-object v1, Lfreemarker/core/ParameterRole;->PARAMETER_DEFAULT:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 347
    :cond_18
    if-ne p1, v0, :cond_1d

    .line 348
    sget-object v1, Lfreemarker/core/ParameterRole;->CATCH_ALL_PARAMETER_NAME:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 349
    :cond_1d
    add-int/lit8 v1, v0, 0x1

    if-ne p1, v1, :cond_24

    .line 350
    sget-object v1, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 352
    :cond_24
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 6
    .param p1, "idx"    # I

    .prologue
    .line 315
    if-nez p1, :cond_5

    .line 316
    iget-object v1, p0, Lfreemarker/core/Macro;->name:Ljava/lang/String;

    .line 329
    :cond_4
    :goto_4
    return-object v1

    .line 318
    :cond_5
    iget-object v2, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v2, 0x1

    .line 319
    .local v0, "argDescsEnd":I
    if-ge p1, v0, :cond_21

    .line 320
    iget-object v2, p0, Lfreemarker/core/Macro;->paramNames:[Ljava/lang/String;

    add-int/lit8 v3, p1, -0x1

    div-int/lit8 v3, v3, 0x2

    aget-object v1, v2, v3

    .line 321
    .local v1, "paramName":Ljava/lang/String;
    rem-int/lit8 v2, p1, 0x2

    if-nez v2, :cond_4

    .line 324
    iget-object v2, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_4

    .line 326
    .end local v1    # "paramName":Ljava/lang/String;
    :cond_21
    if-ne p1, v0, :cond_26

    .line 327
    iget-object v1, p0, Lfreemarker/core/Macro;->catchAllParamName:Ljava/lang/String;

    goto :goto_4

    .line 328
    :cond_26
    add-int/lit8 v2, v0, 0x1

    if-ne p1, v2, :cond_37

    .line 329
    new-instance v1, Ljava/lang/Integer;

    iget-boolean v2, p0, Lfreemarker/core/Macro;->isFunction:Z

    if-eqz v2, :cond_35

    const/4 v2, 0x1

    :goto_31
    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_4

    :cond_35
    const/4 v2, 0x0

    goto :goto_31

    .line 331
    :cond_37
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2
.end method

.method hasArgNamed(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lfreemarker/core/Macro;->paramDefaults:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFunction()Z
    .registers 2

    .prologue
    .line 177
    iget-boolean v0, p0, Lfreemarker/core/Macro;->isFunction:Z

    return v0
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 173
    const/4 v0, 0x0

    return v0
.end method

.method public setCatchAll(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lfreemarker/core/Macro;->catchAllParamName:Ljava/lang/String;

    .line 102
    return-void
.end method
