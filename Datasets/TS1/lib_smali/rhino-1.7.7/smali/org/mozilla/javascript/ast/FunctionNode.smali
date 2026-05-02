.class public Lorg/mozilla/javascript/ast/FunctionNode;
.super Lorg/mozilla/javascript/ast/ScriptNode;
.source "FunctionNode.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/mozilla/javascript/ast/FunctionNode$Form;
    }
.end annotation


# static fields
.field public static final FUNCTION_EXPRESSION:I = 0x2

.field public static final FUNCTION_EXPRESSION_STATEMENT:I = 0x3

.field public static final FUNCTION_STATEMENT:I = 0x1

.field private static final NO_PARAMS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private body:Lorg/mozilla/javascript/ast/AstNode;

.field private functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

.field private functionName:Lorg/mozilla/javascript/ast/Name;

.field private functionType:I

.field private generatorResumePoints:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/Node;",
            ">;"
        }
    .end annotation
.end field

.field private isExpressionClosure:Z

.field private isGenerator:Z

.field private liveLocals:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/mozilla/javascript/Node;",
            "[I>;"
        }
    .end annotation
.end field

.field private lp:I

.field private memberExprNode:Lorg/mozilla/javascript/ast/AstNode;

.field private needsActivation:Z

.field private params:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation
.end field

.field private rp:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/mozilla/javascript/ast/FunctionNode;->NO_PARAMS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 92
    invoke-direct {p0}, Lorg/mozilla/javascript/ast/ScriptNode;-><init>()V

    .line 76
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->FUNCTION:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 77
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    .line 78
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    .line 89
    const/16 v0, 0x6d

    iput v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->type:I

    .line 93
    return-void
.end method

.method public constructor <init>(I)V
    .registers 4
    .param p1, "pos"    # I

    .prologue
    const/4 v1, -0x1

    .line 96
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/ScriptNode;-><init>(I)V

    .line 76
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->FUNCTION:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 77
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    .line 78
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    .line 89
    const/16 v0, 0x6d

    iput v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->type:I

    .line 97
    return-void
.end method

.method public constructor <init>(ILorg/mozilla/javascript/ast/Name;)V
    .registers 5
    .param p1, "pos"    # I
    .param p2, "name"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    const/4 v1, -0x1

    .line 100
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/ast/ScriptNode;-><init>(I)V

    .line 76
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->FUNCTION:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 77
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    .line 78
    iput v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    .line 89
    const/16 v0, 0x6d

    iput v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->type:I

    .line 101
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/ast/FunctionNode;->setFunctionName(Lorg/mozilla/javascript/ast/Name;)V

    .line 102
    return-void
.end method


# virtual methods
.method public addFunction(Lorg/mozilla/javascript/ast/FunctionNode;)I
    .registers 4
    .param p1, "fnNode"    # Lorg/mozilla/javascript/ast/FunctionNode;

    .prologue
    .line 310
    invoke-super {p0, p1}, Lorg/mozilla/javascript/ast/ScriptNode;->addFunction(Lorg/mozilla/javascript/ast/FunctionNode;)I

    move-result v0

    .line 311
    .local v0, "result":I
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->getFunctionCount()I

    move-result v1

    if-lez v1, :cond_d

    .line 312
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->needsActivation:Z

    .line 314
    :cond_d
    return v0
.end method

.method public addLiveLocals(Lorg/mozilla/javascript/Node;[I)V
    .registers 4
    .param p1, "node"    # Lorg/mozilla/javascript/Node;
    .param p2, "locals"    # [I

    .prologue
    .line 303
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 304
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    .line 305
    :cond_b
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    return-void
.end method

.method public addParam(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 3
    .param p1, "param"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 162
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/FunctionNode;->assertNotNull(Ljava/lang/Object;)V

    .line 163
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v0, :cond_e

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    .line 166
    :cond_e
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 168
    return-void
.end method

.method public addResumptionPoint(Lorg/mozilla/javascript/Node;)V
    .registers 3
    .param p1, "target"    # Lorg/mozilla/javascript/Node;

    .prologue
    .line 289
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    if-nez v0, :cond_b

    .line 290
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    .line 291
    :cond_b
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    return-void
.end method

.method public getBody()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->body:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getFunctionName()Lorg/mozilla/javascript/ast/Name;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    return-object v0
.end method

.method public getFunctionType()I
    .registers 2

    .prologue
    .line 321
    iget v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionType:I

    return v0
.end method

.method public getLiveLocals()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/mozilla/javascript/Node;",
            "[I>;"
        }
    .end annotation

    .prologue
    .line 299
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->liveLocals:Ljava/util/Map;

    return-object v0
.end method

.method public getLp()I
    .registers 2

    .prologue
    .line 216
    iget v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    return v0
.end method

.method public getMemberExprNode()Lorg/mozilla/javascript/ast/AstNode;
    .registers 2

    .prologue
    .line 373
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->memberExprNode:Lorg/mozilla/javascript/ast/AstNode;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/Name;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const-string v0, ""

    goto :goto_a
.end method

.method public getParams()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode;->NO_PARAMS:Ljava/util/List;

    goto :goto_6
.end method

.method public getResumptionPoints()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 295
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->generatorResumePoints:Ljava/util/List;

    return-object v0
.end method

.method public getRp()I
    .registers 2

    .prologue
    .line 230
    iget v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    return v0
.end method

.method public isExpressionClosure()Z
    .registers 2

    .prologue
    .line 252
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isExpressionClosure:Z

    return v0
.end method

.method public isGenerator()Z
    .registers 2

    .prologue
    .line 281
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator:Z

    return v0
.end method

.method public isGetterMethod()Z
    .registers 3

    .prologue
    .line 333
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->GETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isMethod()Z
    .registers 3

    .prologue
    .line 329
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->GETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-eq v0, v1, :cond_12

    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->SETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-eq v0, v1, :cond_12

    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->METHOD:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public isNormalMethod()Z
    .registers 3

    .prologue
    .line 341
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->METHOD:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isParam(Lorg/mozilla/javascript/ast/AstNode;)Z
    .registers 3
    .param p1, "node"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 176
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public isSetterMethod()Z
    .registers 3

    .prologue
    .line 337
    iget-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    sget-object v1, Lorg/mozilla/javascript/ast/FunctionNode$Form;->SETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requiresActivation()Z
    .registers 2

    .prologue
    .line 273
    iget-boolean v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->needsActivation:Z

    return v0
.end method

.method public setBody(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 5
    .param p1, "body"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 201
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/FunctionNode;->assertNotNull(Ljava/lang/Object;)V

    .line 202
    iput-object p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->body:Lorg/mozilla/javascript/ast/AstNode;

    .line 203
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/16 v2, 0x19

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/ast/AstNode;->getProp(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 204
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/FunctionNode;->setIsExpressionClosure(Z)V

    .line 206
    :cond_17
    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getPosition()I

    move-result v1

    invoke-virtual {p1}, Lorg/mozilla/javascript/ast/AstNode;->getLength()I

    move-result v2

    add-int v0, v1, v2

    .line 207
    .local v0, "absEnd":I
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 208
    iget v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->position:I

    sub-int v1, v0, v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/FunctionNode;->setLength(I)V

    .line 209
    iget v1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->position:I

    invoke-virtual {p0, v1, v0}, Lorg/mozilla/javascript/ast/FunctionNode;->setEncodedSourceBounds(II)V

    .line 210
    return-void
.end method

.method public setFunctionIsGetterMethod()V
    .registers 2

    .prologue
    .line 345
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->GETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 346
    return-void
.end method

.method public setFunctionIsNormalMethod()V
    .registers 2

    .prologue
    .line 353
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->METHOD:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 354
    return-void
.end method

.method public setFunctionIsSetterMethod()V
    .registers 2

    .prologue
    .line 349
    sget-object v0, Lorg/mozilla/javascript/ast/FunctionNode$Form;->SETTER:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    iput-object v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionForm:Lorg/mozilla/javascript/ast/FunctionNode$Form;

    .line 350
    return-void
.end method

.method public setFunctionName(Lorg/mozilla/javascript/ast/Name;)V
    .registers 2
    .param p1, "name"    # Lorg/mozilla/javascript/ast/Name;

    .prologue
    .line 117
    iput-object p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    .line 118
    if-eqz p1, :cond_7

    .line 119
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/Name;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 120
    :cond_7
    return-void
.end method

.method public setFunctionType(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 325
    iput p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionType:I

    .line 326
    return-void
.end method

.method public setIsExpressionClosure(Z)V
    .registers 2
    .param p1, "isExpressionClosure"    # Z

    .prologue
    .line 259
    iput-boolean p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isExpressionClosure:Z

    .line 260
    return-void
.end method

.method public setIsGenerator()V
    .registers 2

    .prologue
    .line 285
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isGenerator:Z

    .line 286
    return-void
.end method

.method public setLp(I)V
    .registers 2
    .param p1, "lp"    # I

    .prologue
    .line 223
    iput p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    .line 224
    return-void
.end method

.method public setMemberExprNode(Lorg/mozilla/javascript/ast/AstNode;)V
    .registers 2
    .param p1, "node"    # Lorg/mozilla/javascript/ast/AstNode;

    .prologue
    .line 367
    iput-object p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->memberExprNode:Lorg/mozilla/javascript/ast/AstNode;

    .line 368
    if-eqz p1, :cond_7

    .line 369
    invoke-virtual {p1, p0}, Lorg/mozilla/javascript/ast/AstNode;->setParent(Lorg/mozilla/javascript/ast/AstNode;)V

    .line 370
    :cond_7
    return-void
.end method

.method public setParams(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/mozilla/javascript/ast/AstNode;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/mozilla/javascript/ast/AstNode;>;"
    if-nez p1, :cond_6

    .line 146
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    .line 153
    :cond_5
    return-void

    .line 148
    :cond_6
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    if-eqz v2, :cond_f

    .line 149
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 150
    :cond_f
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_13
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 151
    .local v1, "param":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/ast/FunctionNode;->addParam(Lorg/mozilla/javascript/ast/AstNode;)V

    goto :goto_13
.end method

.method public setParens(II)V
    .registers 3
    .param p1, "lp"    # I
    .param p2, "rp"    # I

    .prologue
    .line 244
    iput p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->lp:I

    .line 245
    iput p2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    .line 246
    return-void
.end method

.method public setRequiresActivation()V
    .registers 2

    .prologue
    .line 277
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/ast/FunctionNode;->needsActivation:Z

    .line 278
    return-void
.end method

.method public setRp(I)V
    .registers 2
    .param p1, "rp"    # I

    .prologue
    .line 237
    iput p1, p0, Lorg/mozilla/javascript/ast/FunctionNode;->rp:I

    .line 238
    return-void
.end method

.method public toSource(I)Ljava/lang/String;
    .registers 7
    .param p1, "depth"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 378
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 379
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->isMethod()Z

    move-result v2

    if-nez v2, :cond_19

    .line 380
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/ast/FunctionNode;->makeIndent(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    const-string v2, "function"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    :cond_19
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    if-eqz v2, :cond_2b

    .line 384
    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v2, v3}, Lorg/mozilla/javascript/ast/Name;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    :cond_2b
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    if-nez v2, :cond_72

    .line 388
    const-string v2, "() "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    :goto_34
    iget-boolean v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isExpressionClosure:Z

    if-eqz v2, :cond_8f

    .line 395
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->getBody()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 396
    .local v0, "body":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    instance-of v2, v2, Lorg/mozilla/javascript/ast/ReturnStatement;

    if-eqz v2, :cond_82

    .line 398
    invoke-virtual {v0}, Lorg/mozilla/javascript/ast/AstNode;->getLastChild()Lorg/mozilla/javascript/Node;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/ast/ReturnStatement;

    invoke-virtual {v2}, Lorg/mozilla/javascript/ast/ReturnStatement;->getReturnValue()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v0

    .line 399
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    iget v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionType:I

    if-ne v2, v4, :cond_5e

    .line 401
    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 411
    .end local v0    # "body":Lorg/mozilla/javascript/ast/AstNode;
    :cond_5e
    :goto_5e
    iget v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionType:I

    if-eq v2, v4, :cond_68

    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->isMethod()Z

    move-result v2

    if-eqz v2, :cond_6d

    .line 412
    :cond_68
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    :cond_6d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 390
    :cond_72
    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->params:Ljava/util/List;

    invoke-virtual {p0, v2, v1}, Lorg/mozilla/javascript/ast/FunctionNode;->printList(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 392
    const-string v2, ") "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_34

    .line 405
    .restart local v0    # "body":Lorg/mozilla/javascript/ast/AstNode;
    :cond_82
    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5e

    .line 409
    .end local v0    # "body":Lorg/mozilla/javascript/ast/AstNode;
    :cond_8f
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->getBody()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->toSource(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5e
.end method

.method public visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V
    .registers 5
    .param p1, "v"    # Lorg/mozilla/javascript/ast/NodeVisitor;

    .prologue
    .line 424
    invoke-interface {p1, p0}, Lorg/mozilla/javascript/ast/NodeVisitor;->visit(Lorg/mozilla/javascript/ast/AstNode;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 425
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    if-eqz v2, :cond_f

    .line 426
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->functionName:Lorg/mozilla/javascript/ast/Name;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/Name;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 428
    :cond_f
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->getParams()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/ast/AstNode;

    .line 429
    .local v1, "param":Lorg/mozilla/javascript/ast/AstNode;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    goto :goto_17

    .line 431
    .end local v1    # "param":Lorg/mozilla/javascript/ast/AstNode;
    :cond_27
    invoke-virtual {p0}, Lorg/mozilla/javascript/ast/FunctionNode;->getBody()Lorg/mozilla/javascript/ast/AstNode;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 432
    iget-boolean v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->isExpressionClosure:Z

    if-nez v2, :cond_3b

    .line 433
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->memberExprNode:Lorg/mozilla/javascript/ast/AstNode;

    if-eqz v2, :cond_3b

    .line 434
    iget-object v2, p0, Lorg/mozilla/javascript/ast/FunctionNode;->memberExprNode:Lorg/mozilla/javascript/ast/AstNode;

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/ast/AstNode;->visit(Lorg/mozilla/javascript/ast/NodeVisitor;)V

    .line 438
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_3b
    return-void
.end method
