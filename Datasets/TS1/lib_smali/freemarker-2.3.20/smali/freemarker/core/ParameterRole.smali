.class final Lfreemarker/core/ParameterRole;
.super Ljava/lang/Object;
.source "ParameterRole.java"


# static fields
.field static final ARGUMENT_NAME:Lfreemarker/core/ParameterRole;

.field static final ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

.field static final ASSIGNMENT_SOURCE:Lfreemarker/core/ParameterRole;

.field static final ASSIGNMENT_TARGET:Lfreemarker/core/ParameterRole;

.field static final AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

.field static final CALLEE:Lfreemarker/core/ParameterRole;

.field static final CATCH_ALL_PARAMETER_NAME:Lfreemarker/core/ParameterRole;

.field static final CONDITION:Lfreemarker/core/ParameterRole;

.field static final CONTENT:Lfreemarker/core/ParameterRole;

.field static final EMBEDDED_TEMPLATE:Lfreemarker/core/ParameterRole;

.field static final ENCLOSED_OPERAND:Lfreemarker/core/ParameterRole;

.field static final ENCODING_PARAMETER:Lfreemarker/core/ParameterRole;

.field static final ERROR_HANDLER:Lfreemarker/core/ParameterRole;

.field static final EXPRESSION_TEMPLATE:Lfreemarker/core/ParameterRole;

.field static final ITEM_KEY:Lfreemarker/core/ParameterRole;

.field static final ITEM_VALUE:Lfreemarker/core/ParameterRole;

.field static final LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

.field static final LIST_SOURCE:Lfreemarker/core/ParameterRole;

.field static final MAXIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

.field static final MESSAGE:Lfreemarker/core/ParameterRole;

.field static final MINIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

.field static final NAMESPACE:Lfreemarker/core/ParameterRole;

.field static final NODE:Lfreemarker/core/ParameterRole;

.field static final PARAMETER_DEFAULT:Lfreemarker/core/ParameterRole;

.field static final PARAMETER_NAME:Lfreemarker/core/ParameterRole;

.field static final PARSE_PARAMETER:Lfreemarker/core/ParameterRole;

.field static final PASSED_VALUE:Lfreemarker/core/ParameterRole;

.field static final PLACEHOLDER_VARIABLE:Lfreemarker/core/ParameterRole;

.field static final RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

.field static final TARGET_LOOP_VARIABLE:Lfreemarker/core/ParameterRole;

.field static final TEMPLATE_NAME:Lfreemarker/core/ParameterRole;

.field static final UNKNOWN:Lfreemarker/core/ParameterRole;

.field static final VALUE:Lfreemarker/core/ParameterRole;

.field static final VARIABLE_SCOPE:Lfreemarker/core/ParameterRole;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 11
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "[unknown role]"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->UNKNOWN:Lfreemarker/core/ParameterRole;

    .line 16
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "left-hand operand"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 17
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "right-hand operand"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 18
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "enclosed operand"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ENCLOSED_OPERAND:Lfreemarker/core/ParameterRole;

    .line 19
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "item value"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ITEM_VALUE:Lfreemarker/core/ParameterRole;

    .line 20
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "item key"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ITEM_KEY:Lfreemarker/core/ParameterRole;

    .line 21
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "assignment target"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ASSIGNMENT_TARGET:Lfreemarker/core/ParameterRole;

    .line 22
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "assignment source"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ASSIGNMENT_SOURCE:Lfreemarker/core/ParameterRole;

    .line 23
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "variable scope"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->VARIABLE_SCOPE:Lfreemarker/core/ParameterRole;

    .line 24
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "namespace"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    .line 25
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "error handler"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ERROR_HANDLER:Lfreemarker/core/ParameterRole;

    .line 26
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "passed value"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->PASSED_VALUE:Lfreemarker/core/ParameterRole;

    .line 27
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "condition"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->CONDITION:Lfreemarker/core/ParameterRole;

    .line 28
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "value"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->VALUE:Lfreemarker/core/ParameterRole;

    .line 29
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "AST-node subtype"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    .line 30
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "placeholder variable"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->PLACEHOLDER_VARIABLE:Lfreemarker/core/ParameterRole;

    .line 31
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "expression template"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->EXPRESSION_TEMPLATE:Lfreemarker/core/ParameterRole;

    .line 32
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "list source"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->LIST_SOURCE:Lfreemarker/core/ParameterRole;

    .line 33
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "target loop variable"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->TARGET_LOOP_VARIABLE:Lfreemarker/core/ParameterRole;

    .line 34
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "template name"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->TEMPLATE_NAME:Lfreemarker/core/ParameterRole;

    .line 35
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "\"parse\" parameter"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->PARSE_PARAMETER:Lfreemarker/core/ParameterRole;

    .line 36
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "\"encoding\" parameter"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ENCODING_PARAMETER:Lfreemarker/core/ParameterRole;

    .line 37
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "parameter name"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->PARAMETER_NAME:Lfreemarker/core/ParameterRole;

    .line 38
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "parameter default"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->PARAMETER_DEFAULT:Lfreemarker/core/ParameterRole;

    .line 39
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "catch-all parameter name"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->CATCH_ALL_PARAMETER_NAME:Lfreemarker/core/ParameterRole;

    .line 40
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "argument name"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ARGUMENT_NAME:Lfreemarker/core/ParameterRole;

    .line 41
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "argument value"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

    .line 42
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "content"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->CONTENT:Lfreemarker/core/ParameterRole;

    .line 43
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "embedded template"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->EMBEDDED_TEMPLATE:Lfreemarker/core/ParameterRole;

    .line 44
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "minimum decimals"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->MINIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

    .line 45
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "maximum decimals"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->MAXIMUM_DECIMALS:Lfreemarker/core/ParameterRole;

    .line 46
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "node"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->NODE:Lfreemarker/core/ParameterRole;

    .line 47
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "callee"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->CALLEE:Lfreemarker/core/ParameterRole;

    .line 48
    new-instance v0, Lfreemarker/core/ParameterRole;

    const-string v1, "message"

    invoke-direct {v0, v1}, Lfreemarker/core/ParameterRole;-><init>(Ljava/lang/String;)V

    sput-object v0, Lfreemarker/core/ParameterRole;->MESSAGE:Lfreemarker/core/ParameterRole;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lfreemarker/core/ParameterRole;->name:Ljava/lang/String;

    .line 52
    return-void
.end method

.method static forBinaryOperatorOperand(I)Lfreemarker/core/ParameterRole;
    .registers 2
    .param p0, "paramIndex"    # I

    .prologue
    .line 55
    packed-switch p0, :pswitch_data_10

    .line 58
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 56
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    .line 57
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->RIGHT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 55
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lfreemarker/core/ParameterRole;->name:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lfreemarker/core/ParameterRole;->name:Ljava/lang/String;

    return-object v0
.end method
